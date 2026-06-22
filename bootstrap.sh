#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "🚀 Starting minimalist environment bootstrap..."

# ---------------------------------------------------------------------
# 1. Install Pixi (using official standard instructions)
# ---------------------------------------------------------------------
if ! command -v pixi &> /dev/null; then
    echo "📦 Installing Pixi..."
    # Using curl | bash as per official docs
    curl -fsSL https://pixi.sh/install.sh | bash
    
    # Source the new path immediately so the script can use pixi right away
    export PATH="$HOME/.pixi/bin:$PATH"
else
    echo "✅ Pixi is already installed."
fi

# ---------------------------------------------------------------------
# 2. Use Pixi to globally install core tools
# ---------------------------------------------------------------------
echo "⚙️ Installing CLI tools via Pixi Global..."

# Array of your requested tools
TOOLS=(fish starship zoxide eza fzf btop nano git tmux duf dust duc ncdu rsync rclone)

for tool in "${TOOLS[@]}"; do
    if ! pixi global list | grep -q "^$tool "; then
        echo "Installing $tool..."
        pixi global install "$tool"
    else
        echo "✅ $tool is already installed globally."
    fi
done

# ---------------------------------------------------------------------
# 3. Download Fish config folder (Optimized for Public Repo)
# ---------------------------------------------------------------------
echo "🐠 Setting up Fish configuration..."

# --- REPO CONFIGURATION ---
REPO_USER="ninjit"
REPO_NAME="dotfiles"
BRANCH="main"
# ---------------------------

# Ensure the parent config directory exists
mkdir -p "$HOME/.config"

echo "Downloading and extracting fish configuration..."

# This downloads the repo archive, extracts only the 'fish' folder, 
# and places it directly into ~/.config/fish
curl -fsSL "https://github.com/$REPO_USER/$REPO_NAME/archive/refs/heads/$BRANCH.tar.gz" \
    | tar -xzf - --strip-components=1 -C "$HOME/.config" "$REPO_NAME-$BRANCH/fish"


# ---------------------------------------------------------------------
# 4. Generate/Download Static Shell Completions
# ---------------------------------------------------------------------
echo "✍️ Setting up static tool completions for Fish..."

COMPLETIONS_DIR="$HOME/.config/fish/completions"
mkdir -p "$COMPLETIONS_DIR"

# 1. Generate Pixi completions dynamically
if command -v pixi &> /dev/null; then
    echo "Generating pixi completions..."
    pixi completion --shell fish > "$COMPLETIONS_DIR/pixi.fish"
fi

# 2. Download Eza completions from upstream
if command -v eza &> /dev/null; then
    echo "Downloading eza completions..."
    curl -fsSL "https://github.com/eza-community/eza/raw/refs/heads/main/completions/fish/eza.fish" \
        -o "$COMPLETIONS_DIR/eza.fish"
fi



# ---------------------------------------------------------------------
# 5. Bootstrap Fisher & Plugins (Syntax Isolated)
# ---------------------------------------------------------------------
echo "🔌 Bootstrapping Fisher and syncing plugins..."

# Feed the configuration steps straight into fish's standard input
if [ -f "$HOME/.config/fish/fish_plugins" ]; then
    echo "Syncing plugins from fish_plugins file..."
    
    # Using << 'EOF' guarantees Bash will NOT touch the text inside.
    # No escaping (\$HOME) required! Fish handles it natively.
    fish << 'EOF'
        # Set paths and variables safely inside the transient Fish session
        set -gx PATH $HOME/.pixi/bin $PATH
        set -gx FISHER_SERVER_IDENTIFIER github.com
        
        # do install
        curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

        # Trigger the sync
        fisher update
EOF
else
    echo "⚠️ No fish_plugins file found, skipping plugin installation."
fi


echo "✨ Bootstrap complete! Type 'fish' to enter your new environment."
