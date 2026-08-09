# mac-dev-handbook

A new Mac, set up for development in about fifteen minutes — plus a handbook
that explains what was installed and what to do next.

Two parts, on purpose:

- **`setup.sh`** installs only the boring, universal stuff. It asks you
  nothing and it makes no choices you would want to make yourself.
- **`handbook/`** covers everything with a taste component — your prompt, your
  aliases, your extra apps, your Mac tweaks — one short chapter at a time.

The point is that you end up with a machine you understand, not a machine
somebody else configured for you.

## Requirements

- An Apple Silicon Mac (M1 or later)
- macOS 14 or newer
- Your Mac password, once, when Homebrew asks for it

## Run it

Open **Terminal**: press `Cmd+Space`, type `terminal`, press Enter.

Type each line below and press Enter after it.

**1. Install Apple's developer tools.** A new Mac has no `git` until you do.

```bash
xcode-select --install
```

Click **Install** in the dialog, then wait for it to finish. If it says they are
already installed, good — carry on.

**2. Get this repo and run the setup.**

```bash
git clone https://github.com/niraj8/mac-dev-handbook.git
cd mac-dev-handbook
./setup.sh
```

Ten to fifteen minutes. It asks for your Mac password once. Safe to run again
later — it skips whatever you already have.

## What it installs

| | |
|---|---|
| Homebrew | The package manager everything else comes from |
| Ghostty | Terminal |
| VS Code | Editor — the one most guides assume |
| Zed | Editor — faster, fewer settings, try it once VS Code feels slow |
| Google Chrome | Browser with the devtools most guides assume |
| git, gh | Version control, and GitHub from the terminal |
| mise | Installs language runtimes (Node, Python, …) per project |
| ripgrep, fd, bat, eza, jq, tree, wget, htop, fzf, zoxide | Everyday command line tools |
| oh-my-zsh + plugins | Autosuggestions, syntax highlighting, git aliases |
| JetBrains Mono Nerd Font | Monospace font that includes icon glyphs |

## What it does to your shell config

No dotfiles are copied from this repo. Your `~/.zshrc` stays yours, but the
script does write to it in three ways — worth knowing before you run it:

1. **oh-my-zsh's installer replaces `~/.zshrc`** with its own template. If you
   already had one, it is moved to `~/.zshrc.pre-oh-my-zsh`, not deleted. On a
   brand new Mac there is nothing there to lose.
2. **The `plugins=(...)` line is rewritten** to
   `plugins=(git macos zsh-autosuggestions zsh-syntax-highlighting)`.
3. **A block is appended**, between `# >>> mac-dev-handbook >>>` and
   `# <<< mac-dev-handbook <<<`, holding four `eval` lines (Homebrew, mise,
   zoxide, fzf).

It also writes `~/.config/ghostty/config` — but only if you do not already have
one.

Open `~/.zshrc` and read it. Every line above is plain text you can change or
delete, and [Chapter 03](handbook/03-terminal-fluency.md) walks through what
each one does.

## Then read the handbook

Start at [`handbook/00-read-me-first.md`](handbook/00-read-me-first.md).

Chapter 01 is not optional — your machine cannot talk to GitHub until you do
it. Chapter 02 gets your own website live on the internet. After that, read
whichever chapter is solving a problem you actually have.

| | |
|---|---|
| [00](handbook/00-read-me-first.md) | What the script did, and what is left |
| [01](handbook/01-machine-to-github.md) | Connect your machine to GitHub |
| [02](handbook/02-ship-your-site.md) | Put your own site on the internet |
| [03](handbook/03-terminal-fluency.md) | What zsh and oh-my-zsh actually are |
| [04](handbook/04-aliases.md) | The aliases you already have, and writing your own |
| [05](handbook/05-prompt.md) | Make your prompt useful |
| [06](handbook/06-better-defaults.md) | The command line tools you skipped over |
| [07](handbook/07-nicer-diffs.md) | Readable git diffs with delta |
| [08](handbook/08-mac-tweaks.md) | macOS settings worth changing |
| [09](handbook/09-runtimes.md) | What mise is, and why not "just install Node" |
| [10](handbook/10-apps.md) | Raycast, Rectangle, 1Password |
| [11](handbook/11-containers.md) | What Docker is, and when you need it |

## Undoing it

- The appended block: delete everything between the two
  `mac-dev-handbook` markers in `~/.zshrc`
- The plugin list: edit the `plugins=(...)` line to whatever you want
- oh-my-zsh entirely: `uninstall_oh_my_zsh` — it restores
  `~/.zshrc.pre-oh-my-zsh` if you had one
- Ghostty config: delete `~/.config/ghostty/config`
- A package: `brew uninstall <name>` or `brew uninstall --cask <name>`
- Everything Homebrew: see the uninstall script at https://brew.sh
