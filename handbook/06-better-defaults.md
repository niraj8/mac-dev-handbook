# 06 — The command line tools you skipped over

> Stub. Outline below.

**Read this when:** you are comfortable in the terminal and want to know what
`setup.sh` actually put there. Roughly one tool per sitting; do not read this
as a list to memorise.

## Outline

For each tool: the problem it solves, one command to try right now, and the old
tool it replaces.

- **ripgrep (`rg`)** — search text across a whole project. Respects
  `.gitignore`, skips `node_modules` for free. Replaces `grep -r`. First
  command: `rg TODO`.
- **fd** — find files by name, sane syntax. Replaces `find . -name`, which
  nobody remembers. First command: `fd config`.
- **bat** — `cat` with syntax highlighting and line numbers. Note the paging
  behaviour and `bat -p` for plain output when piping.
- **eza** — `ls` with colours, git status per file, and `eza --tree`. Mention
  `ls` is fine and this is a preference.
- **jq** — query JSON. The one non-obvious tool here; worth a real example
  piping `gh api` output through `jq '.[].name'`.
- **fzf** — fuzzy finder. Already wired into `ctrl-r`. Show `ctrl-t` for file
  paths, and piping anything into `fzf` to pick from it.
- **zoxide (`z`)** — jump to directories by fragment. Explain that it learns as
  you `cd`, so it feels useless on day one and indispensable in week three.
- **htop** — what is eating your CPU or RAM. When to reach for it.
- **tree**, **wget** — one line each, self-explanatory.
- **The pattern.** These tools are mostly faster, `.gitignore`-aware rewrites
  of Unix classics. The originals exist on every server you will ever ssh into,
  so learning `grep` and `find` eventually is not optional.
- **Aliasing them over the originals.** Tempting; see [Chapter 04](04-aliases.md)
  for why to wait.
- **Exercise:** pick the one that solves a problem you had this week. Use only
  that one until it is a habit.
