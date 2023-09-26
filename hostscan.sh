#!/bin/bash

function ctrl_c(){

	exit 1 # matamos el proceso
}

#Ctrl+C
trap ctrl_SIGINT

for i in $(seq 1 254); do
	timeout 1 bash -c "ping -c 1 192.168.0.$i" &>/dev/null && echo "El host 192.168.0.$i esta levantado - ACTIVO" &
done

wait
