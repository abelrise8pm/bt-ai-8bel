#!/usr/bin/env -S uv run --quiet
# /// script
# requires-python = ">=3.10"
# dependencies = []
# ///
"""
Publish the starter directory to the external repository with full git history.

This script must be run from a feature branch that contains ONLY changelog
updates. It creates a temporary merge of origin/main + your branch, ensuring
published content always includes:
  - All commits from origin/main (the canonical source)
  - Your changelog updates

Workflow:
  1. Create a branch with only CHANGELOG.md updates
  2. Run publish-release from that branch
  3. Published content = origin/main + your changelog
  4. Merge your branch to main via PR

Usage:
    ./starter/scripts/publish-release.py
    uv run ./starter/scripts/publish-release.py
"""

import atexit
import shutil
import subprocess
import sys
import time
from dataclasses import dataclass
from pathlib import Path

# Configuration
EXTERNAL_REPO = "git@github.com:rise8-us/xpai-ai-assistant-container-starter.git"
EXTERNAL_BRANCH = "main"
SOURCE_PREFIX = "starter"

EXCLUDE_ITEMS = [
    "specs",
    "tests",
    "DEVELOPMENT.md",
    "scripts/publish-release.sh",
    "scripts/publish-release.py",
    "scripts/check-changelog.sh",
    "scripts/prepare-release.py",
    "docs/PRD-AUTOMATED-ONBOARDING.md",
]


@dataclass
class PublishContext:
    """Tracks state for cleanup."""
    original_dir: Path
    original_branch: str
    merge_branch: str | None = None
    split_branch: str | None = None
    temp_dir: Path | None = None


# Global context for cleanup
_context: PublishContext | None = None


def run_git(*args: str, check: bool = True, capture: bool = True) -> subprocess.CompletedProcess:
    """Run a git command."""
    result = subprocess.run(
        ["git", *args],
        capture_output=capture,
        text=True,
        check=False,
    )
    if check and result.returncode != 0:
        raise RuntimeError(f"git {' '.join(args)} failed: {result.stderr}")
    return result


def info(msg: str) -> None:
    print(f"\033[0;34m▶\033[0m {msg}")


def success(msg: str) -> None:
    print(f"\033[0;32m✓\033[0m {msg}")


def error(msg: str) -> None:
    print(f"\033[0;31m✗\033[0m {msg}", file=sys.stderr)


def cleanup() -> None:
    """Clean up temporary branches and directories."""
    global _context
    if _context is None:
        return

    print()
    info("Cleaning up...")

    # Return to original directory
    try:
        import os
        os.chdir(_context.original_dir)
    except Exception:
        pass

    # Return to original branch
    try:
        current = run_git("branch", "--show-current", check=False).stdout.strip()
        if current != _context.original_branch and _context.original_branch:
            print(f"  Returning to original branch: {_context.original_branch}")
            run_git("checkout", _context.original_branch, check=False)
    except Exception:
        pass

    # Delete merge branch
    if _context.merge_branch:
        try:
            result = run_git("rev-parse", "--verify", _context.merge_branch, check=False)
            if result.returncode == 0:
                print(f"  Deleting temporary merge branch: {_context.merge_branch}")
                run_git("branch", "-D", _context.merge_branch, check=False)
        except Exception:
            pass

    # Delete split branch
    if _context.split_branch:
        try:
            result = run_git("rev-parse", "--verify", _context.split_branch, check=False)
            if result.returncode == 0:
                print(f"  Deleting temporary split branch: {_context.split_branch}")
                run_git("branch", "-D", _context.split_branch, check=False)
        except Exception:
            pass

    # Remove temp directory
    if _context.temp_dir and _context.temp_dir.exists():
        print(f"  Removing temporary directory: {_context.temp_dir}")
        try:
            shutil.rmtree(_context.temp_dir)
        except Exception:
            pass

    success("Cleanup complete")


def validate_environment() -> tuple[Path, str]:
    """Validate we're in the right place and on a feature branch."""
    # Find repo root
    result = run_git("rev-parse", "--show-toplevel")
    repo_root = Path(result.stdout.strip())

    # Verify source prefix exists
    if not (repo_root / SOURCE_PREFIX).is_dir():
        error(f"Must run this script from the repository root (can't find {SOURCE_PREFIX}/)")
        sys.exit(1)

    # Get current branch
    original_branch = run_git("branch", "--show-current").stdout.strip()

    # Verify not on main
    if original_branch == "main":
        error("Cannot publish from main branch.")
        print("Create a feature branch with changelog updates first:")
        print("  git checkout -b docs/starter-changelog-update origin/main")
        print("  # ... update CHANGELOG.md ...")
        print("  git commit -m 'docs(starter): update CHANGELOG.md'")
        print("  ./starter/scripts/publish-release.py")
        sys.exit(1)

    return repo_root, original_branch


def validate_branch_changes() -> None:
    """Verify branch contains only changelog changes."""
    info("Fetching origin/main...")
    run_git("fetch", "origin", "main")

    info("Verifying branch contains only changelog changes...")
    result = run_git("diff", "--name-only", "origin/main...HEAD")
    changed_files = [f for f in result.stdout.strip().split("\n") if f]

    if not changed_files:
        error("Branch has no changes compared to origin/main.")
        print("Update the CHANGELOG.md before publishing.")
        sys.exit(1)

    non_changelog = [f for f in changed_files if not f.endswith("CHANGELOG.md")]

    if non_changelog:
        error("Branch contains non-changelog changes:")
        for f in non_changelog:
            print(f"  - {f}")
        print()
        print("This script only allows branches with CHANGELOG.md updates.")
        print("Create a dedicated changelog branch for publishing.")
        sys.exit(1)

    success("Branch contains only changelog changes")


def validate_clean_tree() -> None:
    """Verify no uncommitted changes."""
    run_git("update-index", "--refresh", "-q", check=False)
    result = run_git("diff-index", "--quiet", "HEAD", "--", check=False)
    if result.returncode != 0:
        error("You have uncommitted changes. Please commit or stash them first.")
        sys.exit(1)


def run_changelog_validation(script_dir: Path) -> None:
    """Run the changelog validation script."""
    print()
    info("Running changelog validation...")
    check_script = script_dir / "check-changelog.sh"

    result = subprocess.run([str(check_script)], check=False)
    if result.returncode != 0:
        print()
        error("Publish aborted: changelog validation failed")
        sys.exit(1)


def create_merge_branch(original_branch: str, merge_branch: str) -> None:
    """Create temporary merge of origin/main + current branch."""
    print()
    info(f"Creating temporary merge of origin/main + {original_branch}...")

    run_git("checkout", "-b", merge_branch, "origin/main")

    result = run_git(
        "merge", original_branch, "--no-edit",
        "-m", f"Temporary merge for publish: origin/main + {original_branch}",
        check=False
    )

    if result.returncode != 0:
        print()
        error(f"Failed to merge {original_branch} into origin/main.")
        print("Resolve conflicts and try again, or rebase your branch:")
        print(f"  git checkout {original_branch}")
        print("  git rebase origin/main")
        sys.exit(1)

    success("Temporary merge created successfully")


def extract_subtree(split_branch: str) -> None:
    """Extract starter/ directory history with path rewriting."""
    print()
    info("Extracting starter/ directory history...")
    print("This may take a moment for repositories with extensive history...")

    run_git("subtree", "split", f"--prefix={SOURCE_PREFIX}", "-b", split_branch, capture=False)


def clone_and_clean(split_branch: str, temp_dir: Path) -> None:
    """Clone split branch and remove excluded items."""
    print()
    info("Creating temporary working directory...")
    temp_dir.mkdir(parents=True, exist_ok=True)

    run_git("clone", "--local", "--no-hardlinks", "--branch", split_branch, ".", str(temp_dir))

    # Change to temp directory
    import os
    os.chdir(temp_dir)

    print()
    info("Removing excluded items from repository...")
    items_removed = False

    for item in EXCLUDE_ITEMS:
        item_path = Path(item)
        if item_path.exists():
            print(f"  - Removing {item}")
            if item_path.is_dir():
                shutil.rmtree(item_path)
            else:
                item_path.unlink()
            run_git("rm", "-rf", item, check=False)
            items_removed = True
        else:
            print(f"  - {item} not found (skipping)")

    # Commit exclusions
    if items_removed:
        print()
        info("Committing exclusions...")
        commit_msg = f"""chore: remove development-only files from published template

Excluded files:
{chr(10).join(f'  - {item}' for item in EXCLUDE_ITEMS)}

These files are used during internal development but are not needed
in the published starter template for project teams."""

        run_git("commit", "-m", commit_msg)


def push_to_external() -> int:
    """Push to external repository."""
    print()
    info("Pushing full history to external repository...")
    print("Note: Using force push to update external repo with complete history")

    run_git("push", "--force", EXTERNAL_REPO, f"HEAD:{EXTERNAL_BRANCH}", capture=False)

    # Get commit count
    result = run_git("rev-list", "--count", "HEAD")
    return int(result.stdout.strip())


def main() -> None:
    global _context

    # Determine script location
    script_path = Path(__file__).resolve()
    script_dir = script_path.parent

    # Generate unique names for temp branches
    timestamp = int(time.time())
    merge_branch = f"starter-publish-merge-{timestamp}"
    split_branch = f"starter-split-{timestamp}"
    temp_dir = Path(f"/tmp/starter-publish-{timestamp}")

    # Validate environment
    repo_root, original_branch = validate_environment()

    # Initialize context for cleanup
    _context = PublishContext(
        original_dir=Path.cwd(),
        original_branch=original_branch,
        merge_branch=merge_branch,
        split_branch=split_branch,
        temp_dir=temp_dir,
    )
    atexit.register(cleanup)

    # Print header
    print()
    print("=" * 60)
    print("  Publishing starter to external repository")
    print("=" * 60)
    print()
    print(f"External repo: {EXTERNAL_REPO}")
    print(f"Excluding: {', '.join(EXCLUDE_ITEMS[:3])}...")
    print()

    # Validations
    validate_branch_changes()
    validate_clean_tree()
    run_changelog_validation(script_dir)

    # Create merge branch
    create_merge_branch(original_branch, merge_branch)
    _context.merge_branch = merge_branch

    # Extract subtree
    extract_subtree(split_branch)
    _context.split_branch = split_branch

    # Clone and clean
    clone_and_clean(split_branch, temp_dir)
    _context.temp_dir = temp_dir

    # Push
    commit_count = push_to_external()

    # Success message
    print()
    print("=" * 60)
    print("  Successfully published to external repository")
    print("=" * 60)
    print()
    print("External repo now has full commit history for the starter directory.")
    print("Paths have been rewritten (starter/ prefix removed).")
    print(f"Total commits published: {commit_count}")
    print()
    print("Next steps:")
    print(f"  1. Push your changelog branch: git push -u origin {original_branch}")
    print("  2. Create PR and merge to main")
    print()
    print("Cleanup will happen automatically.")


if __name__ == "__main__":
    main()
