source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

source_if_exists $HOME/.env.sh
source_if_exists $DOTFILES/zsh/history.zsh
source_if_exists $DOTFILES/zsh/git.zsh
source_if_exists $DOTFILES/zsh/aliases.zsh
source_if_exists /usr/local/etc/profile.d/z.sh
source_if_exists /opt/homebrew/etc/profile.d/z.sh





bindkey -v


#### PLUGINS

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

zinit ice depth=1
#zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
zinit light kutsan/zsh-system-clipboard

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

autoload -Uz compinit && compinit
autoload -Uz fzvim



precmd() {
    source $DOTFILES/zsh/aliases.zsh
}

# Source fzf
source_if_exists ~/.fzf.zsh
source <(fzf --zsh)

eval "$(zoxide init --cmd cd zsh)"

# Moved bindkeys after plugins
bindkey "^[[A" history-beginning-search-backward
bindkey "OA" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "OB" history-beginning-search-forward


eval "$(oh-my-posh init zsh --config $DOTFILES/zsh/powerlevel10k_lean.omp.json)"


# disable bindkey

# Created by `pipx` on 2025-02-03 22:15:21
export PATH="$PATH:/home/gvisona/.local/bin"

fpath+=~/.zfunc; autoload -Uz compinit; compinit

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


