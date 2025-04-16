#!/bin/bash

echo "📥 Installing Git Checkout Wrapper..."

INSTALL_DIR="$HOME/.git-checkout-wrapper"
REPO_URL="git@github.com:your-org/git-checkout-wrapper.git"

# 1. Clone the repo
if [ -d "$INSTALL_DIR" ]; then
    echo "🔁 Wrapper already exists at $INSTALL_DIR"
else
    echo "🔽 Cloning from $REPO_URL..."
    git clone "$REPO_URL" "$INSTALL_DIR" || {
        echo "❌ Clone failed"
        exit 1
    }
fi

cd "$INSTALL_DIR"

# 2. Create .env if not present
if [ ! -f ".env" ]; then
    cp .env.example .env
    echo "✅ Created .env from example"
fi

# 3. Make script executable
chmod +x git-checkout-wrapper.sh

# 4. Add alias to shell config
SHELL_CONFIG="$HOME/.zshrc"
[ -f "$HOME/.bashrc" ] && SHELL_CONFIG="$HOME/.bashrc"

if ! grep -q "alias git=" "$SHELL_CONFIG"; then
    echo "alias git='$INSTALL_DIR/git-checkout-wrapper.sh'" >>"$SHELL_CONFIG"
    echo "✅ Alias added to $SHELL_CONFIG"
else
    echo "⚠️ Alias already exists in $SHELL_CONFIG"
fi

# 5. Reload shell
echo "🔄 Reloading shell config..."
source "$SHELL_CONFIG"

echo "🎉 Done! You can now use: git checkout -b"
