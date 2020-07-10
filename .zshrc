
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/ccache/libexec:$PATH"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export EDITOR="vim"

HISTFILE=$HOME/.zsh_hist
HISTSIZE=99999
SAVEHIST=99999

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
#bindkey '\e[3`' delete-char
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word

setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt inc_append_history
setopt nobeep

[ $(uname) = 'Darwin' ] && {
    alias ls='ls -G'
    alias trm='trash -F'
} || {
    alias grep='grep --color=auto'
    alias ack='ack-grep --color'
    alias ls='ls --color=auto'
}
alias ll='ls -l'
alias la='ll -a'
alias less='less --ignore-case --LONG-PROMPT --tabs=4'
alias duh='du -h --max-depth=1 | sort -h'
alias random_commit='git commit -m "$(curl -s http://whatthecommit.com/index.txt)"'
alias zshconfig='$EDITOR ~/.zshrc'
alias smerge='/Applications/Sublime\ Merge.app/Contents/SharedSupport/bin/smerge'
alias docker-gc='docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc spotify/docker-gc'

# antigen init
source $HOME/.antigen.zsh
source $HOME/.antigenrc

# other settings
export LESSHISTFILE=/dev/null
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export BAT_THEME='Monokai Extended Bright'

