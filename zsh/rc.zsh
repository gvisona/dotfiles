# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

bindkey "^[[A" history-beginning-search-backward
bindkey "OA" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "OB" history-beginning-search-forward
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


#bindkey '^f' autosuggest-accept


# if type "direnv" > /dev/null; then
#     eval "$(direnv hook zsh)"
# fi

#autoload -U zmv
#autoload -U promptinit && promptinit
#autoload -U colors && colors

# if test -z ${ZSH_HIGHLIGHT_DIR+x}; then
# else
#     source $ZSH_HIGHLIGHT_DIR/zsh-syntax-highlighting.zsh
# fi

precmd() {
    source $DOTFILES/zsh/aliases.zsh
}

# Source fzf
source_if_exists ~/.fzf.zsh
source <(fzf --zsh)

eval "$(zoxide init --cmd cd zsh)"



# export VISUAL=vim
# export EDITOR=vim
# export PATH="$PATH:/usr/local/sbin:$DOTFILES/bin:$HOME/.local/bin:$DOTFILES/scripts/"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Created by `pipx` on 2025-02-03 22:15:21
export PATH="$PATH:/home/gvisona/.local/bin"
