---
name: commit-message-format
description: "Generate commit messages in a strict two-part format: one headline, blank line, then bullet list of concrete code changes. Use when writing git commit messages, PR commit descriptions, or squash commit summaries. First try reading staged changes with git diff --staged."
argument-hint: "Optional: provide a short summary only if staged changes are unavailable"
user-invocable: true
---

# Commit Message Format

Use this skill to produce clean, readable commit messages with the exact structure below.

## Required Output Format

1. First line is a concise headline in this shape:
   - `<scope>: <summary>`
   - or `<custom label>: <summary>`
2. Add one empty line.
3. Add a bullet list with concrete changes, one item per line:
   - `- Added ...`
   - `- Updated ...`
   - `- Removed ...`
   - `- Refactored ...`
4. Keep bullets factual and specific to real file/code changes.
5. Use 3 to 6 bullets unless the user requests a different count.

## Headline Rules

- Keep headline short and descriptive.
- Prefer lowercase conventional scopes when applicable: `feat`, `fix`, `refactor`, `test`, `docs`, `chore`, `ci`.
- Allow custom labels when they better match intent, for example `Initial commit`.
- Avoid trailing punctuation in the headline.

## Bullet Rules

- Start each bullet with an action verb like `Added`, `Updated`, `Removed`, `Refactored`, `Set up`.
- Mention meaningful artifacts such as folders, files, workflows, classes, tests, or configs.
- Do not add speculative items. Only include what actually changed.
- Keep each bullet to a single clear change.

## Examples

### Example A

Initial commit: Setup Ruby String Calculator TDD project

- Created project structure with lib/ and test/ directories
- Added StringCalculator class skeleton
- Set up Minitest test framework
- Added .ruby-version for Ruby 3.2.1
- Added Gemfile with Minitest dependency
- Updated README with proper setup instructions

### Example B

ci: adds github action workflow for testing on commit

- Added test.yml workflow to run on push to main branch
- Will show RED/GREEN status in commit history
- Current state should be RED

## Procedure

1. Try to inspect staged changes directly using git diff --staged.
2. If staged changes are empty, try git diff --cached --name-status for quick context.
3. If git is unavailable or there are no staged changes, use the user-provided summary.
4. Pick a headline label and summary that reflect the main intent.
5. List concrete file-level or behavior-level changes as bullets.
6. Ensure exact spacing: headline, one blank line, then bullets.
7. Return only the final commit message text.

## Fallback Rules

- Do not invent changes when staged diff is empty.
- If no staged changes exist, ask the user to stage files or provide a summary.
- Prefer staged content over unstaged changes when generating the message.
