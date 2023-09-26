#!/bin/bash

function ctrl_c(){
    echo -e "\n\n[!] Saliendo... \n"
    exit 1
}

trap ctrl_c SIGINT

declare -a ports=( $(seq 1 65535) )

function checkPort(){
    (exec 3<> /dev/tcp/$1/$2) 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "[+] Host $1 - Puerto $2 (OPEN)"
    fi
    exec 3<&-
    exec 3>&-
}

if [ "$1" ]; then
    count=0
    for port in "${ports[@]}"; do
        if [ "$count" -ge 3400 ]; then
            wait
            count=0
        fi
        checkPort "$1" "$port" &
        ((count++))
    done
    wait
else
    echo -e "\n[!] Uso: $0 <ip-address>\n"
fi
