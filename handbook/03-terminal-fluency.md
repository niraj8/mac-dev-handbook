# 03 — What zsh and oh-my-zsh actually are

> Stub. Outline below.

**Read this when:** the terminal still feels like a place where you paste
commands you found, rather than a place you work.

## Outline

- **Shell vs terminal vs zsh.** Ghostty is a window that draws text. zsh is the
  program inside it that reads what you type. They are separate things people
  use interchangeably.
- **Why zsh and not bash.** Apple switched the default in 2019. Old tutorials
  say bash — mostly harmless, occasional differences worth recognising.
- **What oh-my-zsh adds.** Not magic: a plugin loader, completion setup, and a
  theme system. Point at `~/.oh-my-zsh` and let them look inside.
- **The startup file.** `~/.zshrc` runs on every new shell. The
  `>>> mac-dev-handbook >>>` block is just lines someone else typed. Read it
  line by line and explain each `eval`.
- **The two plugins you already feel.** Autosuggestions (→ to accept, and how it
  reads `~/.zsh_history`); syntax highlighting (red before you hit enter =
  command not found).
- **Tab completion.** The single highest-value habit. Complete commands, paths,
  branch names, flags. Press tab twice to list options.
- **History as a tool.** ↑, then `ctrl-r` for search, then the fzf-powered
  `ctrl-r` the script installed. `history | grep` as the manual fallback.
- **Moving on a line.** `ctrl-a` start, `ctrl-e` end, `ctrl-w` delete word,
  `ctrl-u` clear line, `ctrl-l` clear screen. Muscle memory, ten minutes to
  learn.
- **Jobs.** `ctrl-c` to kill, `ctrl-z` to suspend, `fg` to resume, `&` to
  background. Why a dev server "takes over" a tab and what to do about it.
- **PATH.** What it is, why `command -v <thing>` answers "which one am I
  running", and why "command not found" after installing something is almost
  always this.
- **Reloading.** `source ~/.zshrc` vs opening a new tab.
- **Exercise:** open `~/.zshrc`, delete one line, observe what breaks, put it
  back.
