json_file="config.json"
#Initial
sudo apt-get update

#Install wireguard
sudo apt install wireguard -y

#!!!!!!!!!!Only on server machine!!!!!!!!!!
sudo sysctl -w net.ipv4.ip_forward=1

#Create interface for wireguard
wg genkey | tee privatekey | wg pubkey > publickey

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

#Read from the json the Address with subnet
ip_address=$(jq -r '.WireguardNetwork' "$json_file")

#With this command, we allows us to add new wireguard clients dynamically to our network
sudo ip -4 route add $ip_address dev wg0

echo "Wireguard server setup done!!"