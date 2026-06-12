# My Dotfiles

A lightweight, portable CLI environment designed for zero-root, shared-account utility servers. Powered by [Pixi](https://pixi.sh/) and [Fish Shell](https://fishshell.com/).

## What's Included
* **Shell:** Fish (with custom functions/aliases)
* **Prompt:** Starship (sane defaults)
* **Core Tools:** `zoxide` (jumping), `eza` (ls replacement), `fzf` (fuzzy finding), `btop` (monitoring), `duf` (disk usage), `nano` (editor), git (version control), `rsync`, and `rclone`.

While some of these tools may already exist on a target system, they are often old/outdated.

## Quick Start

To bootstrap this environment on a new machine, paste the following commands into your current bash/zsh shell:

```bash
curl -fsSL https://github.com/ninjit/dotfiles/raw/refs/heads/main/bootstrap.sh -o bootstrap.sh && bash bootstrap.sh
```