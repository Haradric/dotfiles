
export EDITOR="vim"
#export TERM="xterm-256color"

export PATH=~/bin:$PATH

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

#fpath=( $HOME/.zsh/.zfunctions $fpath )
#autoload -U promptinit; promptinit
#prompt pure

alias zconfig='$EDITOR ~/.zshrc'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ll -a'
alias grep='grep --color=auto'
alias ack='ack-grep --color'
alias du='du -h --max-depth=1 | sort -h'
alias zshconfig="$EDITOR ~/.zshrc"
alias random_commit='git commit -m "$(curl -s http://whatthecommit.com/index.txt)"'
alias emacs='emacs -nw'

setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
#setopt share_history
setopt inc_append_history
setopt HIST_IGNORE_DUPS
unsetopt beep

#setopt completealiases
#autoload -Uz compinit
#compinit

#antigen init
ADOTDIR=$HOME/.zsh/.antigen
source $HOME/.zsh/antigen/antigen.zsh

# Load the oh-my-zsh's library
antigen use oh-my-zsh

antigen bundle <<EOBUNDLES
    # Bundles from the default repo (robbyrussell's oh-my-zsh)
    #git

    # Syntax highlighting bundle.
    zsh-users/zsh-syntax-highlighting

    # Fish-like auto suggestions
    zsh-users/zsh-autosuggestions

    # Extra zsh completions
    zsh-users/zsh-completions
EOBUNDLES

# Allow zsh to run multiple asynchronous jobs
antigen bundle mafredri/zsh-async

# Load the theme
antigen bundle sindresorhus/pure

# Tell antigen that you're done
antigen apply
