# 05 — Make your prompt useful

> Stub. Outline below.

**Read this when:** you have run `git status` twice in a row to remember what
branch you are on.

## Outline

- **What the prompt is.** The text before your cursor. It is configurable, and
  it is the one piece of UI you look at thousands of times a day.
- **What it should tell you without being asked:** current directory, git branch,
  whether there are uncommitted changes, whether the last command failed, and —
  later — which language version or cloud profile is active.
- **The default you have now.** oh-my-zsh's `robbyrussell`, set by
  `ZSH_THEME="robbyrussell"` in `~/.zshrc`. It does directory and branch, and
  nothing else.
- **Two paths.** Another oh-my-zsh theme (one line, zero new tools) versus
  starship (separate tool, faster, config file you own, same prompt on any
  machine and any shell). Recommend starship, explain the trade honestly.
- **Installing starship.** `brew install starship`, set `ZSH_THEME=""`, add
  `eval "$(starship init zsh)"` at the *end* of `~/.zshrc` and why the order
  matters.
- **The font question.** Starship's defaults draw icon glyphs. `setup.sh`
  already installed JetBrains Mono Nerd Font and pointed Ghostty at it, so this
  should just work. If you see `□` boxes, the font is the problem — check
  Ghostty's config.
- **Configuring it.** `~/.config/starship.toml`. Start empty and add only what
  you miss. A minimal starting config to paste.
- **Worth turning on early:** command duration for slow commands, an error
  symbol on non-zero exit, git status symbols.
- **Worth turning off:** every language module you do not use. A prompt that
  renders in 400ms is worse than an ugly instant one.
- **Measuring.** Time your shell startup, notice what a slow prompt feels like.
- **Exercise:** make one change, use it for a day, keep or revert. Repeat. A
  prompt copied wholesale from someone's screenshot never fits.
