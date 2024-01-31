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
wg_master_pk=$(jq -r '.WgMasterPk' "$json_file")
master_ip=$(jq -r '.MasterIp' "$json_file")
wg_network=$(jq -r '.WireguardNetwork' "$json_file")

# Create the wg0.conf file with the specified structure
cat > wg0.conf <<EOL
# /etc/wireguard/wg0.conf
[Interface]
# The IP address of this host in the wireguard network
Address = $wg_ip_address
 
# Private key of this host
PrivateKey = $private_key
 
[Peer]
# Public Key of the Master
PublicKey = $wg_master_pk
 
# Public IP of the Master
Endpoint = $master_ip:$port
 
# All traffic for the wireguard network should be routed to our cloud VM
AllowedIPs = $wg_network
 
PersistentKeepalive = 29
EOL

echo "wg0.conf file generated successfully."