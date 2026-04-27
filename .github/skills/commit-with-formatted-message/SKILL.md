---
name: commit-with-formatted-message
description: "Create a git commit using a formatted two-part message (headline, blank line, bullets). Use when the user wants to commit selected changes directly from chat."
argument-hint: "Provide files to include and the commit message headline/bullets"
user-invocable: true
---

# Commit With Formatted Message

Use this skill to create a real git commit from chat using your commit-message format.

## Expected Input

- Which changes to include:
  - all tracked and untracked changes
  - or specific files only
- Commit message content:
  - headline (first line)
  - bullet items (3 to 6 preferred)

## Required Commit Message Format

1. Headline line: `<scope-or-label>: <summary>`
2. One empty line
3. Bullet lines, one per line, such as:
   - `- Added ...`
   - `- Updated ...`
   - `- Removed ...`
   - `- Refactored ...`

## Procedure

1. Run `git status --short` to inspect repository state.
2. Stage files based on user intent:
   - all changes: `git add -A`
   - selected files: `git add <file1> <file2> ...`
3. Validate there is staged content with `git diff --staged --name-status`.
4. Build final commit message text with exact spacing:
   - headline
   - blank line
   - bullet list
5. Show a short preview of the exact commit message only.
6. Ask for explicit confirmation before committing.
7. Create commit with multiline message using:

```bash
git commit -F - <<'EOF'
<headline>

- <bullet 1>
- <bullet 2>
- <bullet 3>
EOF
```

8. Return commit hash and commit headline after success.

## Safety Rules

- Never commit without explicit user confirmation.
- Do not include unstaged files unless the user asked to stage them.
- Do not invent bullet items; they must reflect staged changes.
- If there are no staged changes, stop and ask the user what to stage.
- Do not include raw staged diff or staged file list inside the commit message.
