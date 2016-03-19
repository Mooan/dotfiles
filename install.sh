#!/bin/bash

set -eu
DOTFILES=~/.dotfiles

which git >/dev/null || ( echo "[ERROR] git is required"; exit 1 )

if [ ! -e "$DOTFILES" ]; then
  git clone --recursive https://github.com/Mooan/dotfiles.git $DOTFILES
fi

# Create symbolic link
cd $DOTFILES
for f in .??*; do
  [ "$f" = ".git" ] && continue
  ln -snvf "$DOTFILES/$f" "$HOME/$f"
done

mkdir -pv ~/.vim

# update git preference
git config --global core.editor 'vim -c "set fenc=utf-8"'
git config --global credential.helper cache

echo "Successfully done."

