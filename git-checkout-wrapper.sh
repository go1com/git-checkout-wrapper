#!/bin/bash

# Load .env
if [ -f ".env" ]; then
    export $(grep -v '^#' .env | xargs)
fi

# Jira fallback
JIRA_BASE="${JIRA_URL:-https://yourcompany.atlassian.net}"

# Get Git username
GIT_USER=$(git config user.name 2>/dev/null | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
GIT_USER=${GIT_USER:-anonymous}

# Prompt type
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
            echo "❌ Invalid. Try again."
        fi
    done
}

# Intercept git checkout -b
if [[ "$1" == "checkout" && "$2" == "-b" && "$#" -lt 3 ]]; then
    echo -e "\n🧠 Jira branch setup\n"

    type=$(select_type)

    echo -e "\n🪪 Ticket ID (e.g. GO1-123):"
    read -p "> " ticket
    ticket=$(echo "$ticket" | xargs)

    echo -e "\n✏️  Short description (e.g. Fix login):"
    read -p "> " descRaw
    desc=$(echo "$descRaw" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')

    branch="${type}/${GIT_USER}/${ticket}_${desc}"

    echo -e "\n✅ Creating branch: $branch"
    git checkout -b "$branch"

    commit_msg="${ticket}: ${descRaw}\n\nRelated ticket: ${JIRA_BASE}/browse/${ticket}"
    git commit --allow-empty -m "$(echo -e "$commit_msg")"
    echo "✅ Commit added"
else
    command git "$@"
fi
