---
name: generate-and-commit-message
description: "Generate a two-part commit message from staged git diff, ask for approval, and create the commit. Use when user wants end-to-end commit creation from staged changes."
argument-hint: "Optional: preferred headline scope or custom label"
user-invocable: true
---

# Generate And Commit Message

Use this skill to do the full workflow in one run:

1. inspect staged changes,
2. generate a formatted message,
3. ask for approval,
4. create the commit.

## Message Format

1. Headline: `<scope-or-label>: <summary>`
2. One blank line
3. Bullet list of concrete staged changes (3 to 6 bullets preferred)

Example:

feat: implement string calculator newline delimiter parsing

- Added parsing logic for comma and newline separated input
- Added tests for newline delimiter behavior
- Updated calculator error handling for invalid input

## Procedure

1. Check repository state with `git status --short`.
2. Read staged changes with `git diff --staged`.
3. If staged diff is empty, stop and ask user to stage files first.
4. Generate commit message strictly from staged content:
   - concise headline
   - blank line
   - concrete bullets
5. Show preview of the exact commit message text only.
6. Ask for explicit confirmation:
   - proceed
   - edit message
   - cancel
7. If confirmed, commit using multiline message:

```bash
git commit -F - <<'EOF'
<headline>

- <bullet 1>
- <bullet 2>
- <bullet 3>
EOF
```

8. Return commit hash, headline, and changed file count.

## Safety Rules

- Never run `git commit` without explicit confirmation.
- Never include unstaged-only changes in the message.
- Never invent changes not present in staged diff.
- If a merge conflict exists, stop and ask user to resolve it first.
- Do not include raw staged diff or staged file list inside the commit message.

## Editing Flow

If user asks to tweak wording before commit:

- Keep the same structure (headline, blank line, bullets).
- Keep bullets aligned to staged changes.
- Apply user wording edits, then re-preview before final commit.
