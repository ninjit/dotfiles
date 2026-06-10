# Ensure Pixi Global binaries are at the front of your PATH immediately
fish_add_path $HOME/.pixi/bin

# Preferred CLI text environments
set -gx EDITOR nano
set -gx VISUAL nano
set -gx PAGER less

# Silence the default welcome message
set -g fish_greeting ""

# Colorize man pages for better readability
set -gx LESS_TERMCAP_mb \e\[1\;31m
set -gx LESS_TERMCAP_md \e\[1\;31m
set -gx LESS_TERMCAP_me \e\[0m
set -gx LESS_TERMCAP_se \e\[0m
set -gx LESS_TERMCAP_so \e\[1\;44\;33m
set -gx LESS_TERMCAP_ue \e\[0m
set -gx LESS_TERMCAP_us \e\[1\;32m