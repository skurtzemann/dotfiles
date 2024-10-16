alias b="brew"
alias bb="brew bundle"

alias cdsp="cd $HOME/Private/Sources/"
alias ghqsp="ghq list | grep -v algolia"

alias s="sudo"
alias t="task"
alias u="source ~/.zshrc"
alias v="vagrant"

alias ll="ls -al"

alias python="python3"
alias vmshow="ps -Af | grep hyperkit"

function diff {
  colordiff -u "$@"
}

alias listports="sudo lsof -i -P | grep LISTEN"