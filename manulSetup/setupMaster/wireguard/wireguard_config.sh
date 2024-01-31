#!/bin/bash

# Set the path to the JSON file and private key file
json_file="config.json"
private_key_file="privatekey"

# Check if both files exist
if [ ! -f "$json_file" ] || [ ! -f "$private_key_file" ]; then
    echo "Error: $json_file or $private_key_file not found."
    exit 1
fi

# Read values from the JSON file
wg_ip_address=$(jq -r '.WireguardAddress' "$json_file")
port=$(jq -r '.Port' "$json_file")
private_key=$(cat "$private_key_file")

# Create the wg0.conf file with the specified structure
cat > wg0.conf <<EOL
# /etc/wireguard/wg0.conf
[Interface]

# The IP address of this host in the wireguard tunnels
Address = $wg_ip_address

# Every agent node will connects via UDP to this port. The master node must be reachable on this port via UDP from the internet.
ListenPort = $port

# Set the private key
PrivateKey = $private_key

# Set the MTU according to the internet connections of clients
# In our case the autodetection assumed 8920 since the cloud network supported jumbo frames.
MTU = 1420
EOL

echo "wg0.conf file generated successfully."