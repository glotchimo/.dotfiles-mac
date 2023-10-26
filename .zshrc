export EDITOR=hx

# locale settings
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# path settings
export GOPATH=$HOME/Developer/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/latest/bin

# typewritten (prompt) settings
export TYPEWRITTEN_SYMBOL=
export TYPEWRITTEN_CURSOR=block
export TYPEWRITTEN_ARROW_SYMBOL=→
export TYPEWRITTEN_PROMPT_LAYOUT=singleline
export TYPEWRITTEN_DISABLE_RETURN_CODE=true

# nnn settings
export NNN_TMPFILE='/tmp/.lastd'
export NNN_PLUG='d:diffs'
export NNN_TRASH="1"
export NNN_FCOLORS=""

plugins=(git golang)

n () {
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# aliases
alias ls="n -de"
alias pip="pip3"

alias ,z="$EDITOR ~/.zshrc"
alias ,s="source ~/.zshrc"

alias ,g="lazygit"

alias ,tms="tmux new -s"
alias ,tma="tmux attach-session -t"
alias ,tml="tmux ls"

# autocomplete settings
fpath=($fpath "/Users/emaguire/.zfunctions")
autoload -U compinit && compinit
setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# prompt settings
autoload -U promptinit; promptinit
prompt typewritten
