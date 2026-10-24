#!/bin/zsh

set -e

REPO_DIR="/Users/jim/myEmployment"

if [ -d "$REPO_DIR" ]; then
    cd "$REPO_DIR" || exit
else
    echo "Error: Directory $REPO_DIR does not exist."
    exit 1
fi

echo "[1/4] Checking repository status..."
git status -s

echo ""
echo -n "Enter commit message (Press ENTER for default timestamp): "
read -r COMMIT_MSG

if [ -z "$COMMIT_MSG" ]; then
    COMMIT_MSG="Update portfolio website - $(date '+%Y-%m-%d %H:%M:%S')"
fi

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