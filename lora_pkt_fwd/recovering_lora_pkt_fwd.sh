#!/bin/bash
./../../lora_gateway/reset_lgw.sh start
echo "Waiting for reset to finish before running packet forwarder"
sleep 40
until ./lora_pkt_fwd; do
	echo "Lora Packet Forwarder 'lora_pkt_fwd' crashed with exit code $?. Respawning.." >&2
	sleep 1
	./../../lora_gateway/reset_lgw.sh start
	echo "Waiting for reset to finish before running packet forwarder"
	sleep 40
done
