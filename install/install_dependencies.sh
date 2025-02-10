#!/bin/bash

check_which_system () {
    echo "$(uname -s)"
}

# VARIABLES 

# Install nerd font REWORK
# On Mac brew install font-hack-nerd-font
# On Linux?
# curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.tar.xz


if [ $(check_which_system) == "Linux" ]; then
  echo "Install FiraMono!"
  # mkdir -p ~/.fonts
  # mv FiraMono ~./Fonts
  # fc-cache -fv
elif [ $(check_which_system) == "Darwin" ]; then
  if [ -d "$HOME/Library/Fonts" ]; then
    if [ ! -d "$HOME/Library/Fonts/FiraMonoNerdFont-Regular.otf" ]; then
      curl -s -L  https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.tar.xz | tar xvz - -C $HOME/Library/Fonts
    else
      echo "Fira Mono already downloaded."
    fi
  else
    echo "Install FiraMono!"
  fi
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
if [ $(check_which_system) == "Linux" ]; then
    echo "Installing catpuccin for GNOME terminal"
    curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v1.0.0/install.py | python3 -
elif [ $(check_which_system) == "Darwin" ]; then
  if [ ! -d "$SOFTWARE_FOLDER/iterm" ]; then 
    echo "Downloading catpuccin theme for iTerm. Set it in the preferences."
    git clone https://github.com/catppuccin/iterm.git $SOFTWARE_FOLDER/
  fi
fi

if [ ! -d "$SOFTWARE_FOLDER/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $SOFTWARE_FOLDER/powerlevel10k
  echo '\nsource $SOFTWARE_FOLDER/powerlevel10k/powerlevel10k.zsh-theme' >>~/.env.sh
  echo '\n\nConfigure p10k with "p10k configure"'
else
  echo "Powerlevel10k found in software folder"
fi

if [ ! -d "$HOME/.config/tmux/plugins/catppuccin" ]; then
  mkdir -p ~/.config/tmux/plugins/catppuccin
  git clone -b v2.1.2 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
  echo "\n\nGo fix the window status in ~/.config/tmux/plugins/catppuccin/tmux/catppuccin_options_tmux.conf !! Change the #T to #W\n\n"
else
  echo "Catpuccin for tmux already found!"
fi
# Create vim config directories
# mkdir -p $HOME/.vim $HOME/.vim/autoload $HOME/.vim/backup $HOME/.vim/colors $HOME/.vim/plugged $HOME/.vim/undodir

if [ ! -d "$HOME/.local/bin/zoxide" ]; then
  curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi

if [ ! -d "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim ]; then
    git clone https://github.com/gvisona/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
fi

# ADDITIONAL THINGS TO INSTALL
#

if [ $(check_which_system) == "Linux" ]; then
  echo "Install ripgrep"
  echo "Install bat 'sudo apt install bat'"
  echo "Check if bat is installed as batcat and create symlink"
elif [ $(check_which_system) == "Darwin" ]; then
  echo "Install ripgrep"
  echo "Install bat 'brew install bat'"
fi



# Tmux plugin manager
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  "Tmux Plugin Manager already downloaded"
fi
 
echo "Install Lazygit!" # TODO: fix lazygit installation
# brew install jesseduffield/lazygit/lazygit
echo "Install lazydocker!"
#if [ ! command -v lazydocker 2>&1 >/dev/null ]; then
#  echo "Installing lazydocker"
#  curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
#else
#  echo "Lazydocker already installed!"
#fi
