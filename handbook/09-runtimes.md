# 09 — What mise is, and why not "just install Node"

> Stub. Outline below.

**Read this when:** a project's README says "requires Node 20" or "Python
3.12", or a tutorial tells you to run `brew install node`.

## Outline

- **The naive path and where it breaks.** `brew install node` gives you one
  Node, globally. Fine until the second project needs a different version. Then
  you are uninstalling and reinstalling a language to switch tasks.
- **Why versions matter at all.** A project pinned to Node 18 can fail in
  confusing ways on Node 22. This is not pedantry — it is most "works on my
  machine" bugs.
- **What a version manager does.** Installs many versions side by side, and
  switches automatically based on which directory you are standing in.
- **Why mise specifically.** One tool for Node, Python, Ruby, Go, Java, and
  more — instead of nvm plus pyenv plus rbenv plus sdkman, each with its own
  config and its own line in your `.zshrc`. It is also fast, and reads the
  `.tool-versions` files asdf projects already have.
- **It is already installed and activated.** `setup.sh` installed mise and put
  `eval "$(mise activate zsh)"` in your `~/.zshrc`. It has no runtimes yet — on
  purpose, so the first one you install is one you chose.
- **First use, per project:**
  ```bash
  cd ~/Projects/my-project
  mise use node@22
  ```
  This writes a `mise.toml` in that folder. Explain that committing it means
  the next person gets the same version automatically.
- **Global default,** when you want a Node available anywhere:
  `mise use -g node@lts`.
- **The commands that matter:** `mise ls`, `mise ls-remote node`,
  `mise install`, `mise current`, `mise use`, `mise which node`.
- **How the directory switching works,** briefly — shims and PATH — enough that
  `which node` giving a mise path is not alarming.
- **The confusion to expect:** a globally brew-installed node shadowing mise's.
  `mise doctor` and `command -v node` as the diagnosis.
- **What mise does not do.** Not a package manager for libraries. npm/pip still
  handle dependencies inside a project. Runtimes versus packages is the
  distinction to nail down here.
