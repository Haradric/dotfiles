
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/ccache/libexec:$PATH"
export LANG="en_US.UTF-8"
export EDITOR="vim"

HISTFILE="$HOME/.zsh_hist"
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

# Configuring Completions in zsh
# https://github.com/Linuxbrew/brew/blob/master/docs/Shell-Completion.md#configuring-completions-in-zsh
if type brew &>/dev/null; then
    fpath=( $(brew --prefix)/share/zsh/site-functions "${fpath[@]}" )
fi

# load custom zsh functions
fpath=( ~/.zfuncs "${fpath[@]}" )

alias ls='ls -F'
alias ll='ls -lh'
alias la='ll -a'
alias less='less --ignore-case --LONG-PROMPT --tabs=4'
alias duh='du -h --max-depth=1 | sort -h'
alias random_commit='git commit -m "$(curl -s http://whatthecommit.com/index.txt)"'
alias zshconfig='$EDITOR ~/.zshrc'
alias docker-gc='docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc spotify/docker-gc'

# macOS aliasses
if [[ $OSTYPE == darwin* ]]; then
alias ls='ls -G'
alias trm='trash -F'
alias flush='dscacheutil -flushcache'
# Apps
alias safari='open -a /Applications/Safari.app'
# Browse
alias google='safari https://google.com'

alias dev='cd /Volumes/dev'

# Linux aliasses
elif [[ $OSTYPE == linux* ]]; then
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ack='ack-grep --color'
fi

# antigen init
source "$HOME/.antigen.zsh"
source "$HOME/.antigenrc"

# iTerm2 Shell Integration
if [[ $OSTYPE == darwin* ]]; then
export ITERM2_SQUELCH_MARK=1
source ~/.iterm2_shell_integration.zsh
fi

# other settings
export READNULLCMD='less'
export LESSHISTFILE=/dev/null
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export BAT_THEME='Monokai Extended Bright'
