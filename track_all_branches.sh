#!/bin/bash

repository_url= "git@github.com:mohiyousaf/mysoul.git"

# Clone the repository
git clone "$repository_url"
repo_name=$(basename "$repository_url" .git)
cd "$repo_name" || exit

# Fetch all branches from the remote
git fetch --all

# Track all remote branches locally
for branch in $(git branch -r | grep -v '\->'); do
    git branch --track "${branch#origin/}" "$branch"
done

echo "All branches have been tracked locally."

# Optional: Pull changes for all branches
for branch in $(git branch | sed 's/*//'); do
    git checkout "$branch"
    git pull
done

echo "All branches have been pulled and are up to date."

