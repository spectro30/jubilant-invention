#!/bin/bash



# wait for mysql daemon be running (alive)
function find_master_hosts() {
    found=0
    for line in $data; do
        if [[ "$line" == "master-host" ]]; then
            found=1
            continue
        fi
        if [[ "$found" == "1" ]]; then
            found=0
            peers=("${peers[@]}" "$line")
        fi
        
    done
}

find_master_hosts $data
echo "${peers[*]}"
