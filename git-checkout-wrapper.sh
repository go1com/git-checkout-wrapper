#!/bin/bash

# Load environment variables from .env if available
if [ -f ".env" ]; then
    export $(grep -v '^#' .env | xargs)
fi

# Jira base URL fallback
JIRA_BASE="${JIRA_URL:-https://yourcompany.atlassian.net}"

# Get GitHub username (fallback = anonymous)
GIT_USER=$(git config user.name 2>/dev/null | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
GIT_USER=${GIT_USER:-anonymous}

# Prompt for branch type
select_type() {
    PS3="Type #: "
    options=("feat" "bug" "spike" "task")
    select opt in "${options[@]}"; do
        if [[ -z "$opt" ]]; then
            echo "feat"
            return
        elif [[ "feat bug spike task" == *"$opt"* ]]; then
            echo "$opt"
            return
        else
            echo "❌ Invalid choice. Try again."
        fi
    done
}

# Handle interactive flow only for: git checkout -b (no branch name)
if [[ "$1" == "checkout" && "$2" == "-b" && "$#" -lt 3 ]]; then
    echo "🧠 Starting interactive Jira branch creation..."

    type=$(select_type)

    read -p "🪪 Jira Ticket ID (e.g., PANDA-123): " ticket
    ticket=$(echo "$ticket" | xargs) # trim spaces

    read -p "📝 Short description: " descRaw
    desc=$(echo "$descRaw" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')

    branch="${type}/${GIT_USER}/${ticket}_${desc}"

    echo "✅ Creating branch: $branch"
    git checkout -b "$branch"

    commit_msg="${ticket}: ${descRaw}\n\nRelated ticket: ${JIRA_BASE}/browse/${ticket}"
    git commit --allow-empty -m "$(echo -e "$commit_msg")"
    echo "✅ Created empty commit with message."

else
    # Fallback to real git
    command git "$@"
fi
