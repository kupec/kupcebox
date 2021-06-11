#!/bin/bash
set -e

BIN_ROOT=$(dirname "$(readlink -f "$0")")
source "$BIN_ROOT/../include/helpers.sh"

request_root_access "$0" "$@";

if is_not_root_user; then
    echo "Please run with sudo" >&2
    exit 1;
fi;

PORT=${1:-3000}
NET=${2:-192.168}
IP=""

for ip in $(hostname -I); do
    if [[ $ip =~ ^$NET ]]; then
        IP="$ip"
        break;
    fi;
done;

function close_port {
    echo "Tearing down"
    iptables -D INPUT -p tcp -s "$NET.0.0/16" --dport "$PORT" -j ACCEPT
    echo "OK"
}

trap close_port EXIT 
iptables -A INPUT -p tcp -s "$NET.0.0/16" --dport "$PORT" -j ACCEPT
echo "Port=$PORT opened, IP=$IP"
sleep 8h
