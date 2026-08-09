# 04 — The aliases you already have, and writing your own

> Stub. Outline below.

**Read this when:** you have typed `git status` enough times that it is
starting to feel like a waste of keystrokes. Not before — that irritation is
the qualification.

## Outline

- **The argument for typing it out first.** An alias learned before the command
  is a spell. `gst` teaches you nothing; six months of `git status` means you
  can work on any machine, read any tutorial, and understand any error.
- **What an alias is.** One line of text substitution in your shell. Not a git
  feature, not a magic layer. `alias` with no arguments prints all of them.
- **What oh-my-zsh's git plugin already gave you.** ~150 of them, live right
  now. `alias | grep "git "` to see. The high-frequency ones: `gst`, `gco`,
  `gcb`, `ga`, `gcam`, `gp`, `gl`, `gd`, `glog`.
- **How to check before you trust.** `alias gp` prints the definition. Do this
  before running an unfamiliar one — some of them push.
- **Writing your own.** Where they go in `~/.zshrc` (outside the marker block),
  why `source ~/.zshrc` afterwards.
- **The rule that makes aliases pay off:** write one only after you have typed
  the long form so often that it annoys you. Aliases invented in advance never
  get used.
- **Functions, when an alias is not enough.** Arguments in the middle rather
  than at the end. A small worked example, e.g. `mkcd`.
- **Overriding real commands, and the danger.** `alias cat=bat` is convenient
  until a script breaks. `\cat` and `command cat` to bypass. Be conservative
  early.
- **Keeping them.** Why a dotfiles repo eventually beats a machine-local
  `.zshrc`, and why that is a later problem, not a today problem.
- **Exercise:** for one week, log the command you type most. Alias only that
  one.
