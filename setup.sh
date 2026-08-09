#!/usr/bin/env bash
#
# Sets up a new Apple Silicon Mac for development.
#
# This script only installs things that are boring and universal. Anything
# with a taste component (prompt, aliases, extra apps, macOS tweaks) lives in
# the handbook so you can decide for yourself.
#
# Safe to run more than once.

set -euo pipefail

BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RESET='\033[0m'

step() { printf "\n${BLUE}==>${RESET} %s\n" "$1"; }
info() { printf "    %s\n" "$1"; }
warn() { printf "${YELLOW}    ! %s${RESET}\n" "$1"; }
done_() { printf "${GREEN}    ✓ %s${RESET}\n" "$1"; }

# ---------------------------------------------------------------------------
# 0. Preflight
# ---------------------------------------------------------------------------

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "This script is for macOS only." >&2
  exit 1
fi

if [[ "$(uname -m)" != "arm64" ]]; then
  echo "This script targets Apple Silicon (M1 and later)." >&2
  exit 1
fi

# ---------------------------------------------------------------------------
# 1. Xcode Command Line Tools
#
# Git, compilers, and the headers Homebrew needs. Apple ships these separately
# from Xcode itself.
# ---------------------------------------------------------------------------

step "Xcode Command Line Tools"
if xcode-select -p >/dev/null 2>&1; then
  done_ "already installed"
else
  info "A system dialog will open. Click Install, wait for it to finish,"
  info "then run this script again."
  xcode-select --install || true
  exit 0
fi

# ---------------------------------------------------------------------------
# 2. Homebrew
#
# The package manager for macOS. Almost everything below comes from it.
# ---------------------------------------------------------------------------

step "Homebrew"
if ! command -v brew >/dev/null 2>&1; then
  info "Installing. You will be asked for your Mac password (this is sudo,"
  info "and it is expected)."
  NONINTERACTIVE=1 /bin/bash -c \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
done_ "$(brew --version | head -1)"

# ---------------------------------------------------------------------------
# 3. Command line tools
#
# git      version control
# gh       GitHub from the terminal (auth, repos, pull requests)
# mise     installs and switches language runtimes per project
# ripgrep  fast search across files            (rg)
# fd       fast file finder
# bat      cat, with syntax highlighting
# eza      ls, with colours and a tree view
# jq       reads and queries JSON
# tree     prints a directory as a tree
# wget     downloads files
# htop     what is using my CPU right now
# fzf      fuzzy finder, wires into shell history
# zoxide   cd that remembers the directories you actually use
# ---------------------------------------------------------------------------

step "Command line tools"
FORMULAE=(git gh mise ripgrep fd bat eza jq tree wget htop fzf zoxide)
for f in "${FORMULAE[@]}"; do
  if brew list --formula "$f" >/dev/null 2>&1; then
    info "$f (already installed)"
  else
    info "installing $f"
    brew install "$f"
  fi
done
done_ "command line tools ready"

# ---------------------------------------------------------------------------
# 4. Applications
#
# ghostty                        terminal
# visual-studio-code             editor, the one most guides assume
# zed                            editor, faster, fewer settings
# google-chrome                  browser with the devtools most guides assume
# font-jetbrains-mono-nerd-font  monospace font that includes icon glyphs
# ---------------------------------------------------------------------------

step "Applications"
CASKS=(ghostty visual-studio-code zed google-chrome font-jetbrains-mono-nerd-font)
for c in "${CASKS[@]}"; do
  if brew list --cask "$c" >/dev/null 2>&1; then
    info "$c (already installed)"
  else
    info "installing $c"
    brew install --cask "$c"
  fi
done
done_ "applications ready"

# ---------------------------------------------------------------------------
# 5. Shell: oh-my-zsh and two plugins
#
# zsh is already your shell on macOS. oh-my-zsh is a config framework on top
# of it: it manages plugins and completions.
#
#   git                     ~150 short aliases for git commands
#   zsh-autosuggestions     suggests commands from your history as you type
#   zsh-syntax-highlighting colours commands red until they are valid
# ---------------------------------------------------------------------------

step "oh-my-zsh"
ZSH_DIR="$HOME/.oh-my-zsh"
ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH_DIR/custom}"

if [[ -d "$ZSH_DIR" ]]; then
  done_ "already installed"
else
  if [[ -f "$HOME/.zshrc" ]]; then
    info "oh-my-zsh writes its own .zshrc and moves yours to ~/.zshrc.pre-oh-my-zsh"
  fi
  RUNZSH=no CHSH=no KEEP_ZSHRC=no sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

step "zsh plugins"
clone_plugin() {
  local name="$1" url="$2"
  if [[ -d "$ZSH_CUSTOM/plugins/$name" ]]; then
    info "$name (already installed)"
  else
    info "installing $name"
    git clone --depth 1 "$url" "$ZSH_CUSTOM/plugins/$name"
  fi
}
clone_plugin zsh-autosuggestions https://github.com/zsh-users/zsh-autosuggestions
clone_plugin zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting

# syntax-highlighting must be last in the plugin list or it misbehaves.
touch "$HOME/.zshrc"
PLUGIN_LINE='plugins=(git macos zsh-autosuggestions zsh-syntax-highlighting)'
if grep -q '^plugins=' "$HOME/.zshrc"; then
  /usr/bin/sed -i '' "s/^plugins=.*/$PLUGIN_LINE/" "$HOME/.zshrc"
else
  printf '\n%s\n' "$PLUGIN_LINE" >>"$HOME/.zshrc"
fi
done_ "plugins enabled"

# ---------------------------------------------------------------------------
# 6. Shell config block
#
# Everything this script adds to .zshrc lives between two markers, so it can
# be updated or removed cleanly. Your own edits go outside the block.
# ---------------------------------------------------------------------------

step "Shell configuration"
MARKER_START="# >>> mac-dev-handbook >>>"
MARKER_END="# <<< mac-dev-handbook <<<"

if grep -qF "$MARKER_START" "$HOME/.zshrc"; then
  done_ "block already present in ~/.zshrc"
else
  cat >>"$HOME/.zshrc" <<'EOF'

# >>> mac-dev-handbook >>>
# Added by setup.sh. Edit freely, or delete the whole block to undo it.

# Homebrew: puts brew and everything it installs on your PATH.
eval "$(/opt/homebrew/bin/brew shellenv)"

# mise: activates the language versions a project asks for, per directory.
eval "$(mise activate zsh)"

# zoxide: adds the `z` command. `z proj` jumps to the directory you visit most
# whose name matches "proj".
eval "$(zoxide init zsh)"

# fzf: ctrl-r fuzzy-searches your command history, ctrl-t inserts a file path.
source <(fzf --zsh)
# <<< mac-dev-handbook <<<
EOF
  done_ "block added to ~/.zshrc"
fi

# ---------------------------------------------------------------------------
# 7. Ghostty
#
# A terminal config so text is legible and the icon glyphs render. Skipped if
# you already have one.
# ---------------------------------------------------------------------------

step "Ghostty configuration"
GHOSTTY_CONFIG="$HOME/.config/ghostty/config"
if [[ -f "$GHOSTTY_CONFIG" ]]; then
  done_ "config already exists, leaving it alone"
else
  mkdir -p "$(dirname "$GHOSTTY_CONFIG")"
  cat >"$GHOSTTY_CONFIG" <<'EOF'
font-family = JetBrainsMono Nerd Font
font-size = 14
theme = light:Catppuccin Latte,dark:Catppuccin Mocha
window-padding-x = 8
window-padding-y = 8
macos-option-as-alt = true
EOF
  done_ "wrote $GHOSTTY_CONFIG"
fi

# ---------------------------------------------------------------------------
# 8. Git defaults
#
# Not your name and email. You will set those yourself in Chapter 01, because
# you should know where they are and what they do.
# ---------------------------------------------------------------------------

step "Git defaults"
git config --global init.defaultBranch main
git config --global pull.rebase false
done_ "default branch is main"

# ---------------------------------------------------------------------------
# Done
# ---------------------------------------------------------------------------

printf "\n${GREEN}Setup complete.${RESET}\n\n"
echo "Next:"
echo "  1. Quit Terminal and open Ghostty (Cmd+Space, type 'ghostty')."
echo "  2. Read handbook/00-read-me-first.md"
echo
warn "Your machine cannot talk to GitHub yet. That is Chapter 01."
