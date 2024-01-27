#!/bin/bash

for file in "script/tmp"/*; do
        client_pb=$(cat "$file")
        client_ip=$(basename "$file")
        sudo wg set wg0 peer $client_pb allowed-ips $client_ip/32
done
