#!/bin/bash

check_if_linux () {
    if [ $(uname -s)=="Linux" ] 
    then
        true
    else
        false
    fi
}

# VARIABLES 

# Install nerd font REWORK
# On Mac brew install font-hack-nerd-font
# On Linux?
# curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.tar.xz
if [ -d "$HOME/Library/Fonts" ]; then
  if [ ! -d "$HOME/Library/FontsFiraMonoNerdFont-Regular.otf" ]; then
    curl -s -L  https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.tar.xz | tar xvz - -C $HOME/Library/Fonts
  fi
fi

if [ check_if_linux ]; then
  echo "INSTALL FIRA MONO"
  # mkdir -p ~/.fonts
  # mv FiraMono ~./Fonts
  # fc-cache -fv
fi

# if [ ! -d "$HOME/.local/share/fonts/FiraMono" ]; then
#   mkdir -p $HOME/.local/share/fonts/FiraMono
#   curl -s -L  https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.tar.xz | tar xvz - -C $HOME/.local/share/fonts/FiraMono
# fi


# Install fzf
if [ ! -d "$SOFTWARE_FOLDER/fzf" ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git $SOFTWARE_FOLDER/fzf
  $SOFTWARE_FOLDER/fzf/install
fi

# Install Catpuccin theme for terminal
if [ check_if_linux ]; then
    echo "Installing catpuccin for GNOME terminal"
    curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v1.0.0/install.py | python3 -
fi

if [ ! -d "$SOFTWARE_FOLDER/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $SOFTWARE_FOLDER/powerlevel10k
  echo 'source $SOFTWARE_FOLDER/powerlevel10k/powerlevel10k.zsh-theme' >>~/.env.sh
fi

if [ ! -d "$HOME/.config/tmux/plugins/catppuccin" ]; then
  mkdir -p ~/.config/tmux/plugins/catppuccin
  git clone -b v2.1.2 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
  echo "\n\nGo fix the window status in ~/.config/tmux/plugins/catppuccin/tmux/catppuccin_options_tmux.conf !! Change the #T to #W\n\n"
fi
# Create vim config directories
# mkdir -p $HOME/.vim $HOME/.vim/autoload $HOME/.vim/backup $HOME/.vim/colors $HOME/.vim/plugged $HOME/.vim/undodir



# TODO: fix vim to neovim
# # Setup vim-plug from https://github.com/junegunn/vim-plug
# echo "Setting up vim-plug"
# if [ ! -d "$HOME/.vim/autoload/plug.vim" ]; then
#   curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# fi
 

# # Copy selenized theme for vim
# if [ ! -d "$HOME/.vim/colors/selenized.vim" ]; then
#   echo "Setting up vim color scheme"
#   cp ./vim/selenized.vim $HOME/.vim/colors
# fi
 

#  # Tmux plugin manager
# if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
#   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# fi
 
