#!/usr/bin/env bash
set -euo pipefail

# Copy dotfiles from this repo into the home folder as ~/.<name>.
# Existing files are left untouched.

cd "$(dirname "$0")"

files=(
  aliases
  colour_git_prompt
  shell_functions
  zlogin
  zprofile
  zshrc
)

for file in "${files[@]}"; do
  target="$HOME/.$file"
  if [ -e "$target" ]; then
    echo "Skipping $file ($target already exists)"
  else
    cp "$file" "$target"
    echo "Copied $file -> $target"
  fi
done
