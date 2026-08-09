# 08 — macOS settings worth changing

> Stub. Outline below.

**Read this when:** something about the Mac's default behaviour is getting in
your way. Do not run these because they are here — run the ones that fix a
complaint you actually have.

## Outline

- **What `defaults write` is.** A command line front end to the same preference
  system the System Settings app writes to. Some of these have no checkbox in
  the GUI at all.
- **How to undo any of them:** `defaults delete <domain> <key>`, then log out
  and back in. Show this *before* the list, so nothing feels one-way.
- **Most changes need a logout**, some need `killall Finder` or `killall Dock`.
  Explain per command rather than as a footnote.

### The block

```bash
# Key repeat: hold a key and it repeats fast, instead of crawling.
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Hold a key to repeat it, not to open the accent-picker popup.
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Show dotfiles in Finder — .gitignore, .env, and friends.
defaults write com.apple.finder AppleShowAllFiles -bool true

# Always show file extensions.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show the path bar at the bottom of Finder windows.
defaults write com.apple.finder ShowPathbar -bool true

# Screenshots go to a folder, not all over the Desktop.
mkdir -p ~/Desktop/Screenshots
defaults write com.apple.screencapture location ~/Desktop/Screenshots

# The Dock appears instantly when hidden, instead of after a pause.
defaults write com.apple.dock autohide-delay -float 0
```

- **Why the first three matter most.** Holding a key to move the cursor is
  something you do hundreds of times a day; the default is genuinely slow. The
  accent popup exists for people typing `é`, and fights every developer holding
  `j` in vim.
- **Deliberately not here:** natural scrolling. You already have muscle memory
  either way, and flipping it because a handbook said so is a bad week.
- **Non-`defaults` settings worth changing** in System Settings: trackpad
  tracking speed, Caps Lock remapped to Ctrl or Escape, hot corners, `Cmd+Space`
  if Raycast takes it over ([Chapter 10](10-apps.md)).
- **Exercise:** run only the key repeat lines, log out, log back in. If nothing
  else on this page annoys you today, stop there.
