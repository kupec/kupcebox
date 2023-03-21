QP_ROOT=$(dirname "$(readlink -f "$0")")
source "$QP_ROOT/include/helpers.sh"

alias gitbr='git branch | fzf'
alias gitbrd='git branch -d $(gitbr -m)'
alias gitbrr='git branch -a | sed "s|remotes/origin/||" | fzf -m'
alias gitco='git checkout $(gitbr)'
alias gitcor='git checkout $(gitbrr)'
alias gitpud='git push --delete origin $(gitbrr)'
alias gitrei='git_rebase_i'
alias gitreb='git_rebase_to_branch'
alias gitreib='git_rebase_to_branch -i'
alias gitchp='git cherry-pick $(gitbr)'

function git_rebase_i {
    git br -f copy
    git rebase -i $(git log --oneline --decorate --graph | fzf | pick_col 2)
}

function git_rebase_to_branch() {
    REBASE_FLAGS="$1"
    git br -f copy
    git rebase $REBASE_FLAGS $(gitbr)
}
