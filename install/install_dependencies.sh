#!/bin/bash

# VARIABLES 

# Install nerd font REWORK
# On Mac brew install font-hack-nerd-font
# On Linux?
# curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.tar.xz
if [ -d "$HOME/Library/Fonts" ]; then
  if [ ! -d "$HOME/Library/FontsFiraMonoNerdFont-Regular.otf"]; then
    curl -s -L  https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.tar.xz | tar xvz - -C $HOME/Library/Fonts
  fi
fi
# if [ ! -d "$HOME/.local/share/fonts/FiraMono" ]; then
#   mkdir -p $HOME/.local/share/fonts/FiraMono
#   curl -s -L  https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.tar.xz | tar xvz - -C $HOME/.local/share/fonts/FiraMono
# fi


# Install fzf
# brew install fzf

# Create vim config directories
mkdir -p $HOME/.vim $HOME/.vim/autoload $HOME/.vim/backup $HOME/.vim/colors $HOME/.vim/plugged $HOME/.vim/undodir

# Setup vim-plug from https://github.com/junegunn/vim-plug
echo "Setting up vim-plug"
if [ ! -d "$HOME/.vim/autoload/plug.vim" ]; then
  curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
 

# Copy selenized theme for vim
if [ ! -d "$HOME/.vim/colors/selenized.vim" ]; then
  echo "Setting up vim color scheme"
  cp ./vim/selenized.vim $HOME/.vim/colors
fi
 

 # Tmux plugin manager
if [ -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
 
