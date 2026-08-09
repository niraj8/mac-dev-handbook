# 01 — Connect your machine to GitHub

**Required.** About ten minutes. Nothing else in this handbook works until it
is done.

By the end: git knows who you are, your Mac has an SSH key GitHub trusts, and
you can push code without typing a password.

## 1. Tell git who you are

Every commit records a name and an email. Git does not know yours yet.

```bash
$ git config --global user.name "Your Name"
$ git config --global user.email "you@example.com"
```

Use the email you sign into GitHub with, or GitHub will not connect your
commits to your account.

`--global` means "for every repository on this machine", and writes to
`~/.gitconfig`. A single project can override it later. Check your work:

```bash
$ git config --global --list
```

## 2. Pick your editor

Some git commands open an editor — writing a commit message without `-m`, for
example. The default is `vim`, which is famously hard to *exit* if you have
never used it.

```bash
$ git config --global core.editor "code --wait"
```

`--wait` matters: it tells git to pause until you close the VS Code tab.
Without it, git sees an empty file and gives up.

## 3. Make an SSH key

GitHub needs proof that a push is really coming from you. That proof is an SSH
key: a matched pair of files.

- **Private key** — stays on your Mac, forever, never leaves it, never gets
  pasted anywhere.
- **Public key** — you hand to GitHub. It is safe to share; that is its job.

Anything signed by the private key can be verified with the public key. GitHub
gets the public half and can then recognise you without ever holding a secret
of yours.

```bash
$ ssh-keygen -t ed25519 -C "you@example.com"
```

Three prompts:

**File to save the key** — press enter for the default,
`~/.ssh/id_ed25519`.

**Passphrase** — type a real one. Do not leave it empty.

> A private key with no passphrase is a key anyone holding your laptop can use
> to push code as you. The passphrase encrypts the key file at rest. Step 4
> means you type it once and macOS remembers it, so the cost is one time, and
> the protection is permanent.

**Same passphrase again** — confirm it.

`ed25519` is the modern key type: shorter, faster, and stronger than the older
RSA keys you will see in dated tutorials.

Look at what you made:

```bash
$ ls -l ~/.ssh
id_ed25519       # private. never share, never copy out of this folder.
id_ed25519.pub   # public. this is the one you give away.
```

## 4. Let macOS remember the passphrase

Tell the SSH agent to load your key and store the passphrase in the macOS
keychain:

```bash
$ ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```

Then make that automatic on every restart:

```bash
$ cat >> ~/.ssh/config <<'EOF'
Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
EOF
```

That file tells SSH: for github.com, use this key, load it into the agent, and
get the passphrase from the keychain rather than asking me.

## 5. Sign in with `gh`

`gh` is GitHub's command line tool. One command handles login and uploads your
public key:

```bash
$ gh auth login
```

Answer:

- **What account?** → GitHub.com
- **Protocol?** → SSH
- **Upload your SSH public key?** → `~/.ssh/id_ed25519.pub`
- **Title for the key?** → something recognisable, like `MacBook Air 2026`
- **How to authenticate?** → Login with a web browser

It shows an eight-character code, then opens your browser. Paste the code,
approve, come back to the terminal.

Naming the key matters later. On the day you replace this laptop, you want to
know which key on your GitHub account belongs to the machine you are throwing
away, so you can delete it.

## 6. Check it worked

```bash
$ ssh -T git@github.com
Hi yourusername! You've successfully authenticated, but GitHub does not provide shell access.
```

That sentence looks like a rejection. It is not — it is success. You are
authenticated; GitHub simply does not give out shell accounts.

The first time, SSH asks:

```
The authenticity of host 'github.com' can't be established.
Are you sure you want to continue connecting (yes/no)?
```

Type `yes`. You are recording GitHub's fingerprint so a different server cannot
impersonate it later.

Also confirm `gh`:

```bash
$ gh auth status
```

## Done

Your machine can now push to GitHub. Next: [Chapter 02](02-ship-your-site.md),
where you put a website on the internet.

## If something went wrong

**`Permission denied (publickey)`** — the key is not loaded or was not
uploaded. `ssh-add -l` lists loaded keys; `gh ssh-key list` lists the ones
GitHub has. Fix whichever is empty.

**Asked for a passphrase every single time** — step 4 did not take. Check
`~/.ssh/config` has the block above and re-run the `ssh-add` command.

**Wrong GitHub account** — `gh auth logout`, then start step 5 again.
