#!/bin/bash

set -e

REPO_URL="https://github.com/EisregenHaha/fedora-hyprland/"
CLONE_DIR="$HOME/.cache/fedora-hyprland"
BRANCH="f42"

echo "Cloning Fedora Hyprland dotfiles (branch: $BRANCH)..."

# If the directory exists, prompt reuse or delete
if [[ -d "$CLONE_DIR" ]]; then
    echo "Directory $CLONE_DIR already exists."
    read -rp "Do you want to delete and re-clone it? (y/N): " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        rm -rf "$CLONE_DIR"
        echo "Removed old directory."
    else
        echo "Reusing existing directory."
    fi
fi

# Clone if directory is missing
if [[ ! -d "$CLONE_DIR" ]]; then
    git clone --depth=1 --branch "$BRANCH" "$REPO_URL" "$CLONE_DIR"
    echo "Clone complete."
fi

cd "$CLONE_DIR" || { echo "Failed to enter $CLONE_DIR"; exit 1; }

chmod +x fedora/fedora.sh
bash fedora/fedora.sh

