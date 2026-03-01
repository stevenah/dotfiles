#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

link() {
  local src="$1" dst="$2"
  if [ -L "$dst" ]; then
    rm "$dst"
  elif [ -e "$dst" ]; then
    mkdir -p "$BACKUP_DIR"
    mv "$dst" "$BACKUP_DIR/"
    echo "  backed up $(basename "$dst") → $BACKUP_DIR/"
  fi
  ln -sf "$src" "$dst"
  echo "  linked $dst → $src"
}

echo "Installing dotfiles from $DOTFILES"
echo ""

# Link everything in .config/
mkdir -p "$HOME/.config"
for dir in "$DOTFILES"/.config/*/; do
  name="$(basename "$dir")"
  link "$dir" "$HOME/.config/$name"
done

# Link top-level dotfiles
for file in "$DOTFILES"/.zshenv "$DOTFILES"/.zprofile; do
  [ -e "$file" ] && link "$file" "$HOME/$(basename "$file")"
done

echo ""
echo "Done."
[ -d "${BACKUP_DIR:-}" ] && echo "Backups saved to $BACKUP_DIR"
