
export EDITOR="vim"
export PATH=~/bin:/usr/local/sbin:$PATH:$PATH

HISTFILE=~/.zsh/.zsh_hist
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
#setopt share_history
setopt inc_append_history
setopt HIST_IGNORE_DUPS
unsetopt beep

[ $(uname) = 'Darwin' ] && {
    alias ls='ls -G'
} || {
    alias grep='grep --color=auto'
    alias ack='ack-grep --color'
    alias ls='ls --color=auto'
}
alias ll='ls -l'
alias la='ll -a'
alias du='du -h --max-depth=1 | sort -h'
alias random_commit='git commit -m "$(curl -s http://whatthecommit.com/index.txt)"'
alias zshconfig='$EDITOR ~/.zshrc'

#antigen init
ADOTDIR=$HOME/.zsh/.antigen
source $HOME/.zsh/antigen/antigen.zsh

# Extra zsh completions
antigen bundle zsh-users/zsh-completions

# Autoenv for zsh
antigen bundle Tarrasch/zsh-autoenv

# Allow zsh to run multiple asynchronous jobs
antigen bundle mafredri/zsh-async

# Load the theme
antigen bundle sindresorhus/pure

# Tell antigen that you're done
antigen apply

