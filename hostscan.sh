#!/bin/bash

function ctrl_c(){
	echo -e "\n\n Salimos..\n"
	exit 1 # matamos el proceso
}

#Ctrl+C
trap ctrl_c SIGINT

for i in $(seq 1 254); do
	for port in 21 22 23 25 80 139 443 445 8080; do
		timeout 1 bash -c "echo '' > /dev/tcp/192.168.0.$i/$port" 2>/dev/null && echo "Host 192.168.0.$i UP - Puerto $port UP" &
	done
done

wait
