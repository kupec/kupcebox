function pick_col {
    awk '{print $'"$1"'}'
}

function is_not_root_user {
     [[ $(id -u) != '0' ]]
}

function request_root_access {
    if is_not_root_user; then
        exec sudo "$@";
    fi;
}
