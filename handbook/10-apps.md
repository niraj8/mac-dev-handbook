# 10 — Apps worth adding

> Stub. Outline below.

**Read this when:** the basics work and you want the machine to feel good.
Every app here is a preference, which is why none of them are in `setup.sh`.

## Outline

For each: the problem, the install command, and the one setting that makes it
click.

- **Raycast** (`brew install --cask raycast`) — replaces Spotlight. App
  launcher, clipboard history, window management, snippets, calculator,
  extensions. The setup that matters: bind it to `Cmd+Space` and disable
  Spotlight's shortcut, or the two fight. Clipboard history is the feature
  people underestimate and then cannot live without.
- **Rectangle** (`brew install --cask rectangle`) — keyboard window snapping.
  Half-screen left/right, maximise, thirds. Skippable if you turn on Raycast's
  built-in window management instead; say so rather than installing both.
- **1Password** (`brew install --cask 1password 1password-cli`) — password
  manager. Paid, and worth it. Note the SSH agent feature, which relates
  directly to [Chapter 01](01-machine-to-github.md) and can hold your git
  signing key. The CLI matters later for keeping secrets out of `.env` files
  committed by accident.
- **Zed** — already installed by `setup.sh`. Worth a paragraph here on when to
  reach for it over VS Code: it is dramatically faster on large files and has
  far fewer settings, which is either the appeal or the drawback depending on
  the day.
- **Obsidian** (`brew install --cask obsidian`) — plain markdown notes in a
  folder you own. Good fit for a developer because the notes are just files and
  can live in git.
- **The Unarchiver** (`brew install --cask the-unarchiver`) — opens the archive
  formats macOS refuses to.
- **Also common, mentioned without endorsement:** Arc or Firefox as a second
  browser, TablePlus for databases, Proxyman for HTTP inspection, OBS for
  screen recording.
- **The rule for this chapter.** Install one, use it for a week, then decide.
  Ten new apps in one afternoon means you learn none of them and cannot tell
  which one broke something.
