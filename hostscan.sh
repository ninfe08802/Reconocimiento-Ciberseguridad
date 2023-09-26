#!/bin/bash

function ctrl_c(){
	echo -e "\n\n Salimos..\n"
	exit 1 # matamos el proceso
}

#Ctrl+C
trap ctrl_c SIGINT

for i in $(seq 1 254); do
	timeout 1 bash -c "ping -c 1 192.168.0.$i" &>/dev/null && echo "El host 192.168.0.$i esta levantado - ACTIVO" &
done

wait
