#!/bin/bash
set -o pipefail
set +e

if [ -z "$1" ]; then
    echo "Container ID must be specified"
fi

#GRAVITY_BASH="gravity planet enter -- --notty /usr/bin/bash -- -c"
gravity enter
INDEX=$(docker exec $1 /bin/bash -c 'cat /sys/class/net/eth0/iflink')
VETH=$(ip link | grep ^$INDEX | cut -d ":" -f2 | cut -d "@" -f1)

echo ${VETH//[[:blank:]]/}
