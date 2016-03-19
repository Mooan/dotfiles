if which nvim >/dev/null; then
  # XXX:Not the time yet...
  # export EDITOR=nvim
  export EDITER=vim

  export XDG_CONFIG_HOME=~/.config
  if [ ! -e "$XDG_CONFIG_HOME/nvim" ]; then
    echo "setting up nvim"
    mkdir -p "$XDG_CONFIG_HOME/nvim"
    ln -snvf "$HOME/.vim" "$XDG_CONFIG_HOME/nvim/.vim"
    ln -snvf "$HOME/.dotfiles/.vimrc" "$XDG_CONFIG_HOME/nvim/init.vim"
  fi
else
  export EDITER=vim
fi

