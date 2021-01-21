ROOT=$(dirname "$(readlink -f "$0")")

source "$ROOT/helpers.sh"

alias gitbrd='git branch -d $(git branch | fzf -m)'
alias gitco='git checkout $(git branch | fzf)'
alias gitpud='git push origin :$(git branch | fzf)'
alias gitrei='git-rebase-i'

function git-rebase-i {
    git rebase -i $(git log --oneline --decorate --graph | fzf | pick-col 2)
}

