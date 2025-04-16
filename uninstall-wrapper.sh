#!/bin/bash

INSTALL_DIR="$HOME/.git-checkout-wrapper"
SHELL_CONFIG="$HOME/.zshrc"
[ -f "$HOME/.bashrc" ] && SHELL_CONFIG="$HOME/.bashrc"

echo "🧹 Uninstalling Git Checkout Wrapper..."

# 1. Remove alias
if grep -q "alias git=" "$SHELL_CONFIG"; then
    sed -i '' '/alias git=.*git-checkout-wrapper.sh/d' "$SHELL_CONFIG"
    echo "✅ Removed alias from $SHELL_CONFIG"
else
    echo "ℹ️ No alias found in $SHELL_CONFIG"
fi

# 2. Remove installed directory
if [ -d "$INSTALL_DIR" ]; then
    rm -rf "$INSTALL_DIR"
    echo "✅ Deleted $INSTALL_DIR"
else
    echo "ℹ️ Install folder not found"
fi

echo ""
echo "💡 Please restart your terminal or run: source $SHELL_CONFIG"
echo "✅ Uninstall complete."
