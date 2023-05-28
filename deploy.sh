#!/bin/sh

# If a command fails then the deploy stops
set -e

cp ~/OneDrive\ -\ Bar\ Ilan\ University/Noam-Hoffer-CV.pdf ./static/

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
hugo.exe # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
		msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

