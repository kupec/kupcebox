QP_ROOT=$(dirname "$(readlink -f "$0")")
source "$QP_ROOT/include/helpers.sh"

alias spr='select_project'

function select_project {
    if [[ -z "$PROJ_DIR" ]]; then
        echo "Please export PROJ_DIR="
        return
    fi;

    cd $(ls -d "$PROJ_DIR"/*/ | fzf)
}
