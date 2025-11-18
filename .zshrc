## Bmacs' ZSH Config

# PATH exports
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH="/Users/bmacs/.local/bin:$PATH"
export PATH="/usr/local/opt/AVRToolchain/bin:$PATH"
export PATH="/Users/bmacs/.cargo/bin:$PATH"
export PATH=$PATH:/Users/bmacs/.spicetify

# Aliases
alias vim=nvim
alias ls='lsd'
alias batt='upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -i "percentage\|state"'
alias chat='pushd ~/alpaca/alpaca.cpp/alpaca.cpp/; ./chat; popd'
alias zls='zellij list-sessions'
alias z='zellij attach bmacs'
alias za='zellij attach bmacs'
alias zl='zellij list-sessions'
alias zd='zellij d --force'
alias zj='zellij'

# Run on start
zellij list-sessions
zellij action list-clients

# Environment
export windows=A0:36:BC:3D:87:6C
export windows_sleep=6C:87:3D:BC:36:A0
USE_POWERLINE="true"
export KEYTIMEOUT=1

# Prompt
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m%{$reset_color%}:%F{94}%~%{$fg[red]%}]%F{10}$%b "

# History
HISTSIZE=100000
SAVEHIST=100000
HISTDUP=erase
HISTFILE=~/.zsh_history
setopt append_history
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_find_no_dups

# Key bindings
bindkey '^k' history-search-backward
bindkey '^j' history-search-forward

# Tab completion setup
setopt AUTO_MENU
setopt MENU_COMPLETE

autoload -Uz compinit
setopt CORRECT
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)  # Include hidden files

# Tab completion navigation
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# BACKWARDS TAB CYCLING - Shift+Tab
bindkey '^[[Z' reverse-menu-complete

# Zinit plugin manager
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

export EDITOR=nvim

# Load zinit extensions
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# Load plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit snippet OMZP::git
