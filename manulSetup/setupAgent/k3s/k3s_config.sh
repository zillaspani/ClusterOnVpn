json_file="../wireguard/config.json"
ip_address=$(jq -r '.HostWireguardAddress' "$json_file")

cat > node-ip.conf <<EOL
# /etc/systemd/system/k3s-agent.service.d/node-ip.conf
[Service]
ExecStart=
ExecStart=/usr/local/bin/k3s agent --node-ip $ip_address --flannel-iface=wg0
EOL

echo "node-ip.conf.conf file generated successfully."