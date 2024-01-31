json_file="config.json"
#Initial
sudo apt-get update

#Install wireguard
sudo apt install wireguard -y

#Create interface for wireguard
wg genkey | tee privatekey | wg pubkey > publickey

#!!!
#QUI DOVREI SCAMBIARE LA WG PUBLIC KEY CON IL MASTER
#!!!

chmod +x setup2.sh