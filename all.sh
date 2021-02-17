QP_ROOT=$(dirname "$(readlink -f "$0")")

export PATH="$PATH:$QP_ROOT/bin"

source "$QP_ROOT/git_aliases.sh"
source "$QP_ROOT/tmux_aliases.sh"
