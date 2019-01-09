
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"

export EDITOR="vim"

HISTFILE=$HOME/.zsh_hist
HISTSIZE=9999
SAVEHIST=9999

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
setopt inc_append_history
setopt nobeep

[ $(uname) = 'Darwin' ] && {
    alias ls='ls -G'
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

# antigen init
source $HOME/.antigen.zsh
source $HOME/.antigenrc

# Load Homebrew config script
#source $HOME/.brewconfig.zsh

# other settings
export LESSHISTFILE=/dev/null

