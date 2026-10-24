#!/bin/zsh

# Exit immediately if a command fails
set -e

# Repository directory configured to your VS Code project folder
REPO_DIR="/Users/jim/myEmployment"

echo "========================================="
echo " Starting GitHub Pages Portfolio Deployment"
echo "========================================="

# Navigate to target directory
if [ -d "$REPO_DIR" ]; then
    cd "$REPO_DIR" || exit
else
    echo "Error: Directory $REPO_DIR does not exist."
    exit 1
fi

# Check git status
echo "[1/4] Checking repository status..."
git status -s

# Prompt for custom commit message or default to timestamp
echo ""
echo -n "Enter commit message (Press ENTER for default timestamp): "
read -r COMMIT_MSG

if [ -z "$COMMIT_MSG" ]; then
    COMMIT_MSG="Update portfolio website - $(date '+%Y-%m-%d %H:%M:%S')"
fi

# Add changes, commit, and push
echo "[2/4] Staging modified files..."
git add .

echo "[3/4] Committing changes: '$COMMIT_MSG'"
git commit -m "$COMMIT_MSG" || { echo "No changes to commit."; exit 0; }

echo "[4/4] Pushing changes to GitHub..."
git push -u origin main

echo ""
echo "========================================="
echo " Deployment Complete! Site updated."
echo "========================================="