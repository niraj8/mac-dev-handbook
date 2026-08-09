# 11 — What Docker is, and when you need it

> Stub. Outline below.

**Read this when:** a project's README says `docker compose up`, or you need a
database and do not want to install PostgreSQL onto your Mac permanently.

Not before. Docker is a few gigabytes, runs a background virtual machine, and
solves a problem you may not have yet.

## Outline

- **The problem it solves.** An app needs a specific Linux, specific system
  libraries, and a specific database version. Installing all of that directly
  on your Mac is slow to set up and painful to remove.
- **What a container is.** A packaged filesystem plus a process, isolated from
  your machine, started from a recipe. Emphasise: not a virtual machine in the
  usual sense, though on a Mac there is a Linux VM underneath making it work —
  which is why it costs RAM here and not on a Linux server.
- **Image versus container.** The recipe versus the running thing. This is the
  distinction beginners trip on; land it before any commands.
- **Install.** `brew install --cask docker-desktop`. Note it requires a sign-in
  and takes real disk space. Mention OrbStack as a lighter paid alternative,
  and `colima` as the free CLI-only route, without pushing either.
- **The four commands to start with:** `docker ps`, `docker run`,
  `docker compose up`, `docker compose down`.
- **The realistic first use.** A database for a project without installing it
  on your Mac:
  ```bash
  docker run --name pg -e POSTGRES_PASSWORD=dev -p 5432:5432 -d postgres:16
  ```
  Then explain each flag, especially `-p` port mapping, because that is where
  "why can't I connect" comes from.
- **`docker-compose.yml`.** Most projects hand you one. You mostly run it
  rather than write it, at first.
- **Where the disk goes.** Images accumulate silently and eat tens of
  gigabytes. `docker system df` and `docker system prune`, with a clear warning
  about what prune deletes.
- **What you do not need it for.** A static site. A plain Node or Python app.
  Anything mise already handles ([Chapter 09](09-runtimes.md)). Say this
  plainly — a lot of beginners containerise things that did not need it.
