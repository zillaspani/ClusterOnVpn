json_file="../wireguard/config.json"
ip_address=$(jq -r '.WireguardAddress' "$json_file")

cat > network.conf <<EOL
# /etc/systemd/system/k3s.service.d/network.conf 
[Service]
ExecStart=
ExecStart=/usr/local/bin/k3s server --advertise-address $ip_address --flannel-iface=wg0
EOL

echo "network.conf file generated successfully."