# 00 — Read me first

You ran `setup.sh`. Your Mac now has the tools. It is not yet *yours*, and it
cannot yet talk to GitHub.

This chapter tells you what happened, what is deliberately missing, and where
to go next.

## What the script did

**Homebrew.** A package manager: one command to install, update, and remove
software. `brew install ripgrep` instead of finding a website, downloading a
`.dmg`, and dragging an icon. Everything below arrived through it.

**A terminal and editors.** Ghostty for the terminal, VS Code for editing code,
Chrome for its devtools. Zed is there too — a second editor, faster and with
far fewer settings. Use VS Code while you are following tutorials, since that
is what they assume, and open Zed on a day VS Code feels sluggish.

**Command line tools.** `git`, `gh`, `mise`, and a set of everyday tools —
`rg`, `fd`, `bat`, `eza`, `jq`, `tree`, `wget`, `htop`, `fzf`, `z`. You do not
need to learn these now. Chapter 06 goes through them when you are ready.

**A shell setup.** zsh was already your shell. oh-my-zsh sits on top of it and
gives you three things you will notice immediately:

- grey text suggesting a command from your history as you type — press → to accept
- commands turning green when valid and red when not, before you hit enter
- short aliases for git: `gst` for `git status`, `gco` for `git checkout`, and
  about 150 more

Ignore the git aliases for now. Type the full commands until they are boring.
Chapter 04 explains this, and it is a real recommendation, not politeness.

**A `.zshrc` block.** Your shell config lives at `~/.zshrc`. Everything the
script added is between two marker lines. Open it and look:

```bash
code ~/.zshrc
```

Reading your own config early is worth ten tutorials later.

## What is deliberately missing

The script installed nothing that involves your taste or your accounts:

- your name and email in git
- your GitHub login
- your prompt
- your aliases
- your Mac settings
- language runtimes like Node or Python

Those are the chapters. They are missing because a setup script that makes
those choices for you leaves you with a machine you cannot debug.

## Where to go next

**Chapter 01 is required.** Nothing works with GitHub until you do it — about
ten minutes.

**Chapter 02 is the fun one.** Your own website, on a domain you own, live on
the internet. Do it the same day. Having something real on the internet is what
keeps the rest of this interesting.

After that: read a chapter when you hit the problem it solves. Your prompt
annoys you → Chapter 05. `git diff` is unreadable → Chapter 07. A project's
README says "Node 20" → Chapter 09. There is no order and no completion.

## How to read the commands

Lines starting with `$` are for you to type — do not type the `$`:

```bash
$ git --version
git version 2.51.0
```

The line under it is what you should see back. If you see something different,
that is information, not failure. Read it.
