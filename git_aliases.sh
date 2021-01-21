QP_ROOT=$(dirname "$(readlink -f "$0")")
source "$QP_ROOT/include/helpers.sh"

alias gitbrd='git branch -d $(git branch | fzf -m)'
alias gitco='git checkout $(git branch | fzf)'
alias gitpud='git push origin :$(git branch | fzf)'
alias gitrei='git_rebase_i'

function git_rebase_i {
    git rebase -i $(git log --oneline --decorate --graph | fzf | pick_col 2)
}

