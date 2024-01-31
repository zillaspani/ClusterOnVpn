json_file="config.json"
master_ip_wg=$(jq -r '.MasterIpWG' "$json_file")
#Generating the config file:
chmod +x wireguard_config.sh

#Install jq tool to read the config.json
sudo apt-get install jq -y

#Run the interface_config.sh
./wireguard_config.sh

#Copy the config file in the directory /etc/wireguard/
sudo cp wg0.conf /etc/wireguard/wg0.conf
echo "wg0.conf copied!"

#Bring up the interface
wg-quick up wg0

echo "Wireguard client setup done!!Testing with ping"

ping -c 4 $master_ip_wg

