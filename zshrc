autoload -U colors && colors

HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000

export EDITOR="vim"

# run bundled scripts with 'bundle exec' when appropriate
# https://github.com/gma/bundler-exec
[ -f ~/.bundler-exec.sh ] && source ~/.bundler-exec.sh

function __git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != *"working tree clean"* ]]
}

function __git_branch {
  git rev-parse --git-dir >& /dev/null
  if [[ $? == 0 ]]
  then
    branch_name=$(git branch | grep '* ' | sed 's/..//')

    if __git_dirty; then color=yellow; else color=green; fi

    echo -n ":%{$fg[$color]%}$branch_name%{$reset_color%}"
  fi
}

PROMPT='%~$(__git_branch) %% '

# this could be more robust, but it's adequate
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  PROMPT="[%{$fg[cyan]%}%m%{$reset_color%}] $PROMPT"
fi

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

setopt no_case_glob

setopt prompt_subst
setopt rmstarsilent

unsetopt autocd beep nomatch extendedglob

zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit ; compinit

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# use emacs mode keybindings
bindkey -e

# augment up and down arrows to iterate through history beginning with a partially typed command
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

alias ..='cd ..'
alias be='bundle exec'
alias bake='bundle exec rake'
alias c='cargo'
alias dc='docker-compose'
alias p3='python3'
alias py='python'
alias gti='git'
alias gl='git log --graph --pretty="format:$fg[yellow]%h$fg[green]%d$reset_color %s $fg_bold[black]%an, %ar$reset_color"'
# alias ll='ls -lh'
# alias la='ls -lha'
alias ls='exa'
alias la='exa -la'
alias ll='exa -l --git --time-style=full-iso'
alias lh='nmap -sn 192.168.1.0/24'
alias t='tmux'
alias irb='pry'
alias serve='ruby -run -e httpd . -p 9090'
alias gti='git'
alias dc='docker-compose'

alias m="make"

alias y="yarn"
alias ..="cd .."

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


PATH=$HOME/.rbenv/bin:$PATH
PATH=/usr/local/share/npm/bin:$PATH
PATH=/usr/local/go/bin:$PATH
export PATH=$PATH

export SVN_EDITOR=vim
export PAGER='less -R'

eval "$(rbenv init -)"

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

eval "$(direnv hook zsh)"
