#!/bin/bash
set -e

BIN_ROOT=$(dirname "$(readlink -f "$0")")
source "$BIN_ROOT/../include/helpers.sh"

if is_not_root_user; then
    echo "Please run with sudo" >&2
    exit 1;
fi;

PORT=${1:-3000}
IP=""

for ip in $(hostname -I); do
    if [[ $ip =~ ^192.168. ]]; then
        IP="$ip"
        break;
    fi;
done;

function close_port {
    echo "Tearing down"
    iptables -D INPUT -p tcp -s 192.168.0.0/24 --dport "$PORT" -j ACCEPT
    echo "OK"
}

trap close_port EXIT 
iptables -A INPUT -p tcp -s 192.168.0.0/24 --dport "$PORT" -j ACCEPT
echo "Port=$PORT opened, IP=$IP"
sleep 8h
