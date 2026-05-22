---
name: git-daily-save
description: Guide Abel through daily git best practices — staging changes, committing with a descriptive message, and pushing to remote. Keeps work saved and backed up on GitHub at the end of every session.
argument-hint: "[run this at the end of your work session, or whenever you want to save your progress]"
---

# Git Daily Save

A daily git workflow skill for a non-engineer PM. Run this at the end of each work session to ensure all changes are staged, committed with a clear message, and pushed to GitHub.

---

## Workflow

1. **Check what changed** — run `git status` and summarize what files are new or modified in plain language.
2. **Stage all changes** — run `git add .`
3. **Suggest a commit message** — suggest a message in this format: `docs: <short description of what changed>`. Ask: "Does this message look good, or would you like to change it?" Wait for confirmation before proceeding.
4. **Commit** — run `git commit -m "<confirmed message>"`
5. **Push to remote** — run `git push origin <current branch>`
6. **Confirm** — tell Abel: "Your changes are saved to GitHub on branch `<branch name>`. Great work today!"

---

## Branch Reminders

- Always work on a named branch, never directly on `main`
- Weekly branch naming convention: `abel/topic-MMDD-MMDD`
- To create a new weekly branch: `git checkout -b abel/<topic-MMDD-MMDD>`
- To switch branches: `git checkout <branch-name>`

---

## Scope

**Do:**
- Run `git status` first and explain what changed in plain language
- Suggest a commit message but always let Abel edit it before committing
- Push to the current branch automatically
- Remind Abel of the current branch name at the end

**Don't:**
- Commit without Abel confirming the message
- Push to `main` directly
- Skip the status check
