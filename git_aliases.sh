QP_ROOT=$(dirname "$(readlink -f "$0")")
source "$QP_ROOT/include/helpers.sh"

alias gitbr='git branch | fzf'
alias gitbrd='git branch -d $(gitbr -m)'
alias gitco='git checkout $(gitbr)'
alias gitpud='git push --delete origin $(git branch -a | sed "s|remotes/origin/||" | fzf -m)'
alias gitrei='git_rebase_i'

function git_rebase_i {
    git rebase -i $(git log --oneline --decorate --graph | fzf | pick_col 2)
}

