# 02 — Put your own site on the internet

Three steps. At the end you own a domain, and typing it into any browser on
earth loads a page you wrote.

The goal is **live today**, not good. It will be one ugly page with no styling.
That is correct. A live ugly page beats a beautiful one on your laptop, and you
can only improve something that exists.

Prerequisite: [Chapter 01](01-machine-to-github.md).

---

## Step 1 — Buy a domain

Around $10–15 a year. **[Namecheap](https://www.namecheap.com)** is a good
default: fair prices, a DNS panel that is not hostile, no constant upselling.

> **The one trap.** Registrars advertise a cheap first year and renew at a much
> higher price. A `.com` at $1.98 for year one can be $18 at renewal. Look at
> the **renewal** price before you buy, not the headline. A boring `.com` at a
> flat $12/year beats a novelty extension that triples in year two.

Advice on the name: your own name if it is available. `yourname.com`,
`yourname.dev`, or `yourname.me`. It stays relevant no matter what you end up
building, and you will be typing it on job applications for the next decade.

Buy it. Do nothing else with it yet — Step 3 is where it gets connected.

---

## Step 2 — Write and publish a page

GitHub gives every account one free website. Create a repository named exactly
`yourusername.github.io` — that exact name is what makes it special.

```bash
$ mkdir -p ~/Projects/yourusername.github.io
$ cd ~/Projects/yourusername.github.io
$ git init
```

Make the page. `code index.html`, then:

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Your Name</title>
  </head>
  <body>
    <h1>Your Name</h1>
    <p>I build things. This page is the first one.</p>
    <p><a href="https://github.com/yourusername">GitHub</a></p>
  </body>
</html>
```

No CSS. Resist. You can look at it locally by opening the file:

```bash
$ open index.html
```

Then commit and push it:

```bash
$ git add index.html
$ git commit -m "Add first version of my site"
$ gh repo create yourusername.github.io --public --source . --push
```

`gh repo create` with `--source .` makes the repo on GitHub, wires your local
folder to it, and pushes — all at once.

Now turn on Pages:

```bash
$ gh browse --settings
```

In **Pages** in the left sidebar, set **Source** to "Deploy from a branch",
branch `main`, folder `/ (root)`, and Save.

Wait a minute, then visit **`https://yourusername.github.io`**.

That is your site. On the internet. Anyone can load it.

Every push updates it. Change a word, `git add`, `git commit`, `git push`, and
the live site changes about a minute later. That loop is the entire point —
everything else you learn plugs into it.

---

## Step 3 — Point your domain at it

Right now your site lives at `yourusername.github.io`. You want it at the
domain you bought in Step 1.

**This step is your homework.** Search for:

> github pages custom domain dns

You are looking for GitHub's own documentation. What you need to know going in:

- The technology is **DNS** — the system that turns a domain name into the
  address of a server. Buying a domain gives you the name; DNS is how you say
  what it points at.
- The work happens in **two places**: records added in Namecheap's DNS panel,
  and a **Custom domain** field in your repository's Pages settings. Both, or
  it does not work.
- You will read about **A records** and **CNAME records**. Which you need
  depends on whether you want `yourname.com` or `www.yourname.com`. GitHub's
  docs spell out both.
- **DNS is slow.** Changes can take minutes to hours to spread. If it does not
  work immediately, wait before you start changing things — most people break a
  correct setup by fiddling during the wait.
- Once it resolves, tick **Enforce HTTPS** in the Pages settings so your site
  loads over `https://`.

Doing this yourself is the point. It is the first time you will configure
infrastructure from documentation instead of a tutorial, and every deploy for
the rest of your career is a bigger version of the same thing.

---

## Done

You own a domain, you have a live site, and you can update it with three
commands.

From here, go where your curiosity is. Add CSS. Add a page about something you
made. Break the layout and fix it. The chapters in this handbook are there when
a specific thing starts annoying you — there is no order and nothing to
complete.
