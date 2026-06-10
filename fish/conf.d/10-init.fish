if status is-interactive
# Commands to run in interactive sessions can go here
	# Initialize Zoxide (Directory jumping)
	if command -v zoxide > /dev/null
		zoxide init fish | source
	end

	# Initialize FZF (Interactive fuzzy matching & keybindings)
	if command -v fzf > /dev/null
		fzf --fish | source
	end

	# Initialize Starship Prompt (Must be at the very end to render correctly)
	if command -v starship > /dev/null
		starship init fish | source
	end
end
