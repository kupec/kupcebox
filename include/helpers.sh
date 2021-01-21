function pick_col {
    awk '{print $'"$1"'}'
}

function is_not_root_user {
     [[ $(id -u) != '0' ]]
}
