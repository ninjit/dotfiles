# My Dotfiles

A lightweight, portable CLI environment designed for zero-root, shared-account systems.  
...Because I was getting tired of missing my terminal structure on every new system I connect to.  
Powered by [Pixi](https://pixi.sh/) and [Fish Shell](https://fishshell.com/).

> [!CAUTION]
> If you aren't me, and somehow stumbled across this repo, please inspect the scripts before attempting to use for your own purposes.

## Quick Start

To bootstrap this environment on a new machine, paste the following commands into your current bash/zsh shell:

```bash
curl -fsSL https://ninjit.github.io/dotfiles/bootstrap.sh -o bootstrap.sh && bash bootstrap.sh
```

## What's Included
* **Shell:** `fish` (with custom functions/aliases)
* **Prompt:** `starship` (sane defaults)
* **Core Tools:**
	- `zoxide` (directory jumping)
	- `eza` (ls replacement)
	- `fzf` (fuzzy finding)
	- `btop` (system monitoring)
	- `duf` (disk + filesystem usage)
	- `nano` (text editor)
	- `git` (version control)
	- `tmux` (terminal multiplexer)
	- `rsync`, and `rclone` (remote filesystem transfers + syncing)

While some of these tools may already exist on a target system, they are often old/outdated.
