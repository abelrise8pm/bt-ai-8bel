#!/usr/bin/env -S uv run --quiet
# /// script
# requires-python = ">=3.10"
# dependencies = []
# ///
"""
Prepare a release by creating a changelog branch and outputting commit data.

This script handles all deterministic tasks:
  1. Creates a changelog branch from origin/main
  2. Validates no non-changelog commits exist
  3. Finds undocumented commits on origin/main
  4. Outputs structured JSON with commit data for changelog generation

After running this script, update CHANGELOG.md with the commit information,
then run publish-release.sh to complete the release.

Usage:
    ./starter/scripts/prepare-release.py
    uv run ./starter/scripts/prepare-release.py
"""

import json
import re
import subprocess
import sys
from dataclasses import dataclass, asdict
from datetime import datetime
from pathlib import Path


@dataclass
class CommitInfo:
    sha: str
    date: str
    message: str
    body: str
    files: list[str]
    link: str
    diff_stat: str
    version_changes: dict[str, str]


@dataclass
class ReleasePrep:
    status: str  # "ready", "up_to_date", "error"
    branch: str
    source_prefix: str
    changelog_path: str
    repo_url: str
    next_date_heading: str
    commits: list[CommitInfo]
    error: str | None = None


def run_git(*args: str, check: bool = True) -> str:
    """Run a git command and return stdout."""
    result = subprocess.run(
        ["git", *args],
        capture_output=True,
        text=True,
        check=False,
    )
    if check and result.returncode != 0:
        raise RuntimeError(f"git {' '.join(args)} failed: {result.stderr}")
    return result.stdout.strip()


def get_repo_root() -> Path:
    """Get the repository root directory."""
    root = run_git("rev-parse", "--show-toplevel")
    return Path(root)


def get_repo_url() -> str:
    """Get the GitHub repository URL."""
    url = run_git("remote", "get-url", "origin")
    # Convert SSH to HTTPS format
    url = re.sub(r"git@github\.com:", "https://github.com/", url)
    url = re.sub(r"\.git$", "", url)
    return url


def get_current_branch() -> str:
    """Get the current branch name."""
    return run_git("branch", "--show-current")


def get_documented_shas(changelog_path: Path) -> set[str]:
    """Extract commit SHAs already documented in the changelog."""
    if not changelog_path.exists():
        return set()
    content = changelog_path.read_text()
    # Match [abc1234](https://...) style links
    return set(re.findall(r"\[([a-f0-9]{7})\]\(", content))


def get_commits_since(since_sha: str, source_prefix: str) -> list[str]:
    """Get commit SHAs since a given commit for a directory."""
    output = run_git(
        "log",
        "--format=%h",
        f"{since_sha}..origin/main",
        "--",
        f"{source_prefix}/",
    )
    return [sha for sha in output.split("\n") if sha]


def get_commit_files(sha: str, source_prefix: str) -> list[str]:
    """Get files changed in a commit for a directory."""
    output = run_git(
        "diff-tree",
        "--no-commit-id",
        "--name-only",
        "-r",
        sha,
        "--",
        f"{source_prefix}/",
    )
    prefix_len = len(source_prefix) + 1  # +1 for /
    return [f[prefix_len:] for f in output.split("\n") if f]


def get_commit_info(sha: str, source_prefix: str, repo_url: str) -> CommitInfo:
    """Get detailed information about a commit."""
    # Basic info
    date = run_git("log", "-1", "--format=%ad", "--date=short", sha)
    message = run_git("log", "-1", "--format=%s", sha)
    body = run_git("log", "-1", "--format=%b", sha)

    # Files changed
    files = get_commit_files(sha, source_prefix)

    # Diff stat
    diff_output = run_git("show", "--stat", sha, "--", f"{source_prefix}/")
    # Extract just the summary line (e.g., "3 files changed, 50 insertions(+), 10 deletions(-)")
    diff_lines = diff_output.strip().split("\n")
    diff_stat = diff_lines[-1] if diff_lines else ""

    # Detect version changes (image SHAs, version numbers)
    version_changes = detect_version_changes(sha, source_prefix, files)

    return CommitInfo(
        sha=sha,
        date=date,
        message=message,
        body=body.strip(),
        files=files,
        link=f"{repo_url}/commit/{sha}",
        diff_stat=diff_stat,
        version_changes=version_changes,
    )


def detect_version_changes(sha: str, source_prefix: str, files: list[str]) -> dict[str, str]:
    """Detect version or SHA changes in modified files."""
    changes = {}

    version_files = [
        "Dockerfile",
        "docker-compose.yml",
        "docker-compose.firewall.yml",
        ".devcontainer/devcontainer.json",
        "scripts/template/devcontainer_example.jsonc",
        "project-container/Dockerfile",
    ]

    for f in files:
        if f not in version_files:
            continue

        file_path = f"{source_prefix}/{f}"

        try:
            old_content = run_git("show", f"{sha}^:{file_path}", check=False)
            new_content = run_git("show", f"{sha}:{file_path}", check=False)
        except Exception:
            continue

        # Check for SHA256 changes (container images)
        old_shas = set(re.findall(r"sha256:[a-f0-9]{64}", old_content))
        new_shas = set(re.findall(r"sha256:[a-f0-9]{64}", new_content))

        if old_shas != new_shas:
            changes["image_sha"] = "updated"

        # Check for version number changes (e.g., VERSION=1.2.3)
        old_versions = re.findall(r"VERSION[=:]?\s*['\"]?(\d+\.\d+\.\d+)", old_content)
        new_versions = re.findall(r"VERSION[=:]?\s*['\"]?(\d+\.\d+\.\d+)", new_content)

        if old_versions and new_versions and old_versions != new_versions:
            changes["version"] = f"{old_versions[0]} → {new_versions[0]}"

    return changes


def find_latest_documented_commit(source_prefix: str, documented_shas: set[str]) -> str | None:
    """Find the most recent commit that's documented in the changelog."""
    output = run_git("log", "--format=%h", "origin/main", "--", f"{source_prefix}/")

    for sha in output.split("\n"):
        if sha in documented_shas:
            return sha

    return None


def validate_branch_state(source_prefix: str) -> tuple[bool, str]:
    """
    Validate the current branch has no non-changelog commits.
    Returns (is_valid, error_message).
    """
    current = get_current_branch()

    if current == "main":
        return True, ""  # Will create new branch

    # Check for non-changelog changes
    try:
        changed = run_git("diff", "--name-only", "origin/main...HEAD")
    except RuntimeError:
        return True, ""  # No commits on branch yet

    if not changed:
        return True, ""

    non_changelog = [f for f in changed.split("\n") if f and not f.endswith("CHANGELOG.md")]

    if non_changelog:
        return False, f"Branch has non-changelog changes: {', '.join(non_changelog)}"

    return True, ""


def create_or_switch_branch(source_prefix: str) -> str:
    """Create a changelog branch or verify we're on one."""
    date_stamp = datetime.now().strftime("%Y%m%d")
    branch_name = f"docs/{source_prefix}-changelog-{date_stamp}"
    current = get_current_branch()

    if current == "main":
        run_git("checkout", "-b", branch_name, "origin/main")
        return branch_name
    else:
        return current


def prepare_release(source_prefix: str) -> ReleasePrep:
    """Main function to prepare a release."""
    repo_root = get_repo_root()
    changelog_path = repo_root / source_prefix / "CHANGELOG.md"
    repo_url = get_repo_url()
    next_heading = datetime.now().strftime("%B %-d, %Y")

    # Fetch latest
    run_git("fetch", "origin", "main")

    # Validate branch state
    is_valid, error = validate_branch_state(source_prefix)
    if not is_valid:
        return ReleasePrep(
            status="error",
            branch=get_current_branch(),
            source_prefix=source_prefix,
            changelog_path=str(changelog_path.relative_to(repo_root)),
            repo_url=repo_url,
            next_date_heading=next_heading,
            commits=[],
            error=error,
        )

    # Create/switch branch
    branch = create_or_switch_branch(source_prefix)

    # Find documented commits
    documented_shas = get_documented_shas(changelog_path)
    latest_documented = find_latest_documented_commit(source_prefix, documented_shas)

    if not latest_documented:
        return ReleasePrep(
            status="error",
            branch=branch,
            source_prefix=source_prefix,
            changelog_path=str(changelog_path.relative_to(repo_root)),
            repo_url=repo_url,
            next_date_heading=next_heading,
            commits=[],
            error="Could not find any documented commits in changelog",
        )

    # Get undocumented commits
    all_commits = get_commits_since(latest_documented, source_prefix)

    # Filter out changelog-only commits
    undocumented = []
    for sha in all_commits:
        files = get_commit_files(sha, source_prefix)
        if files != ["CHANGELOG.md"]:
            undocumented.append(sha)

    if not undocumented:
        return ReleasePrep(
            status="up_to_date",
            branch=branch,
            source_prefix=source_prefix,
            changelog_path=str(changelog_path.relative_to(repo_root)),
            repo_url=repo_url,
            next_date_heading=next_heading,
            commits=[],
        )

    # Gather commit info
    commits = [get_commit_info(sha, source_prefix, repo_url) for sha in undocumented]

    return ReleasePrep(
        status="ready",
        branch=branch,
        source_prefix=source_prefix,
        changelog_path=str(changelog_path.relative_to(repo_root)),
        repo_url=repo_url,
        next_date_heading=next_heading,
        commits=commits,
    )


def main():
    # Determine source prefix from script location
    script_path = Path(__file__).resolve()
    source_prefix = script_path.parent.parent.name  # scripts/../ = starter/

    # Verify we're in a git repo
    try:
        get_repo_root()
    except RuntimeError:
        print(json.dumps({"status": "error", "error": "Not in a git repository"}))
        sys.exit(1)

    # Run preparation
    result = prepare_release(source_prefix)

    # Output JSON
    print(json.dumps(asdict(result), indent=2))

    # Exit code based on status
    if result.status == "error":
        sys.exit(1)
    elif result.status == "up_to_date":
        sys.exit(0)
    else:
        sys.exit(0)


if __name__ == "__main__":
    main()
