# 07 — Readable git diffs with delta

> Stub. Outline below.

**Read this when:** you have started reading `git diff` output carefully and
the wall of red and green is slowing you down.

## Outline

- **The problem.** Default `git diff` gives whole-line red/green with no syntax
  highlighting. On a one-character change you have to hunt for the character.
- **What delta does.** Side-by-side or unified view, syntax highlighting,
  word-level highlighting inside a changed line, line numbers, readable file
  headers.
- **Install.** `brew install git-delta`. Note the formula is `git-delta` but
  the binary is `delta`.
- **Wiring it into git.** `~/.gitconfig` block: `core.pager`,
  `interactive.diffFilter`, `[delta] navigate = true`, `line-numbers = true`.
  Show it as a config block to paste, and explain each line rather than handing
  over a magic incantation.
- **What it changes.** `git diff`, `git show`, `git log -p`, and `git add -p`
  all route through it.
- **`navigate`.** `n` and `N` to jump between files inside the pager. Small
  feature, disproportionately useful on a big diff.
- **Side-by-side.** `delta.side-by-side = true`, and why to leave it off on a
  laptop screen.
- **Turning it off temporarily.** `git --no-pager diff`, and why you will want
  this when piping diff output into something else.
- **Related but separate:** `git add -p` for staging part of a file. Arguably
  more valuable than delta itself; mention it here since delta makes it
  readable.
- **Also worth knowing:** VS Code's built-in diff view, and `gh pr diff` for
  reviewing without leaving the terminal.
