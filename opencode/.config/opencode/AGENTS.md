# Global Agent Guidelines

## Verify, don't assume
- Check behavior of libraries/frameworks against the installed version's source.
- Reproduce with a non-interactive run before claiming a fix works.
- Run the project formatter/linter; commit only clean code.

## Ask instead of guessing
- If a request is ambiguous, requirements are unclear, or you are unsure which
  approach is wanted, ask for clarification rather than assuming.
- Surface assumptions and tradeoffs explicitly; confirm before acting on
  anything irreversible or hard to undo.
- Prefer asking a focused question over making a broad, unrequested change.

## Track multi-step work
- For multi-step tasks, keep a short explicit checklist and update it as you
  finish each step so progress and next actions stay visible.

## Make minimal, surgical changes
- Change only what the task requires; avoid opportunistic refactors, renames,
  and rewrites.
- Match the surrounding style, structure, and conventions of the code you touch.
- Don't reformat, reorder, or "clean up" code you weren't asked to change.
- Leave unrelated files, comments, and behavior untouched.
- Keep diffs small and reviewable; explain any change that reaches beyond the
  requested scope.

## Version control
- Never rewrite shared history (amend/rebase/filter-branch/force-push) without explicit approval.
- Flag employer/internal identifiers and secrets; ask before removing them.
- Commit messages: imperative subject + bullets of key changes.
