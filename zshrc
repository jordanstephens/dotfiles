autoload -U colors && colors

HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000

EDITOR="vim"

PROMPT="%~ %% "

# add rbenv to path
PATH=$HOME/.rbenv/bin:$PATH

export GREP_OPTIONS='--color=auto --exclude=*.swp --exclude-dir=.svn'
export SVN_EDITOR=vim
export PAGER='less -R'

setopt append_history
setopt inc_append_history
setopt extended_history
setopt share_history
setopt hist_verify

setopt hist_ignore_space
setopt hist_reduce_blanks

setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_save_no_dups

setopt rmstarsilent

unsetopt autocd beep nomatch extendedglob

zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit ; compinit

# use emacs mode keybindings
bindkey -e

# augment up and down arrows to iterate through history beginning with a partially typed command
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

alias bex='bundle exec'
alias ..='cd ..'
alias g='grep -inr'
alias gl='git log --graph --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset"'
alias ll='ls -l'
alias la='ls -la'

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

