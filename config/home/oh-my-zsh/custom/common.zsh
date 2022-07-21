alias b="brew"
alias bb="brew bundle"

alias cdsp="cd $HOME/Private/Sources/"

alias s="sudo"
alias t="task"
alias u="source ~/.zshrc"
alias v="vagrant"

alias ll="ls -al"

# alias bat="bat --paging=never"

alias python="python3"
alias vmshow="ps -Af | grep hyperkit"

function diff {
  colordiff -u "$@"
}

export SYNO_MAC_ADDR=""
alias synoup="wakeonlan -i 192.168.1.100 $SYNO_MAC_ADDR"