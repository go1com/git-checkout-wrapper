# Git Checkout Wrapper

CLI tool to standardize Git branch creation with Jira integration at go1.

## Setup

### Quick Install (Recommended)
```bash
curl -s https://raw.githubusercontent.com/go1com/git-checkout-wrapper/main/install-wrapper.sh | bash
```

### Manual Setup (Advanced)
1. Install globally:
```bash
git clone git@github.com:go1com/git-checkout-wrapper.git
cd git-checkout-wrapper
cp .env.example .env
# Edit .env with your Jira URL
JIRA_URL=https://go1.atlassian.net

# Make the script executable
chmod +x install-wrapper.sh

# Run the installer
./install-wrapper.sh
```

2. In any new project:
```bash
# Initialize git if not already done
git init

# Create a new branch
git checkout -b
# Follow the prompts to create a standardized branch
```

Format: `feat/username/GO1-123_description`

Types: feat, bug, spike, task

## Example

```bash
# In your project directory
git init
git checkout -b
# You'll be prompted for:
# 1. Branch type (feat, bug, spike, task)
# 2. Jira ticket ID (e.g., GO1-123)
# 3. Short description
# Result: feat/your-username/GO1-123_implement-new-feature
```

## Uninstall

To remove the wrapper:

1. Remove the installation directory:
```bash
rm -rf ~/.git-checkout-wrapper
```

2. Remove the Git alias from your shell config:
```bash
# For zsh (macOS)
sed -i '' '/alias git=.*git-checkout-wrapper/d' ~/.zshrc

# For zsh (Linux)
sed -i '/alias git=.*git-checkout-wrapper/d' ~/.zshrc

# For bash (macOS)
sed -i '' '/alias git=.*git-checkout-wrapper/d' ~/.bashrc

# For bash (Linux)
sed -i '/alias git=.*git-checkout-wrapper/d' ~/.bashrc
```

3. Reload your shell:
```bash
source ~/.zshrc  # or source ~/.bashrc
```
