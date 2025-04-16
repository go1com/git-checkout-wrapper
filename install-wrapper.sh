#!/bin/bash

echo -e "\n📥 Installing Git Checkout Wrapper...\n"

INSTALL_DIR="$HOME/.git-checkout-wrapper"
REPO_URL="git@github.com:go1com/git-checkout-wrapper.git"

# Clone
if [ -d "$INSTALL_DIR" ]; then
    echo "🔁 Already installed at $INSTALL_DIR"
else
    echo "🔽 Cloning..."
    git clone "$REPO_URL" "$INSTALL_DIR" || {
        echo "❌ Clone failed"
        exit 1
    }
fi

cd "$INSTALL_DIR"

# Jira URL prompt
echo -e "\n🌐 Jira URL (e.g. https://go1web.atlassian.net):"
read -p "> " jira_url_input
jira_url_input=$(echo "$jira_url_input" | xargs)

if [[ -z "$jira_url_input" ]]; then
    echo "❌ Required"
    exit 1
fi

echo "JIRA_URL=$jira_url_input" >.env
echo "✅ .env created"

# Make executable
chmod +x git-checkout-wrapper.sh

# Add alias
SHELL_CONFIG="$HOME/.zshrc"
[ -f "$HOME/.bashrc" ] && SHELL_CONFIG="$HOME/.bashrc"

if ! grep -q "alias git=" "$SHELL_CONFIG"; then
    echo "alias git='$INSTALL_DIR/git-checkout-wrapper.sh'" >>"$SHELL_CONFIG"
    echo "✅ Alias added"
else
    echo "⚠️ Alias exists"
fi

# Done
echo -e "\n✅ Done. Run: source $SHELL_CONFIG"
echo "Try: git checkout -b"
