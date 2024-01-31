json_file="../wireguard/config.json"
master_ip_wg=$(jq -r '.MasterIpWG' "$json_file")
k3s_token=$(jq -r '.K3SToken' "$json_file")

#Installation of K3S
#curl -sfL https://get.k3s.io | K3S_URL=https://$master_ip_wg:6443 K3S_TOKEN=$k3s_token  sh -
export K3S_TOKEN="K101468e8bb01c9e1397af845d7fc7ab1145bbcb329c5e1bd88f48a641ffd970603::server:ef62726f9c3ad185224f988f02d1b024"
export K3S_URL="https://10.0.0.1:6443"
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--node-external-ip=10.0.0.2 --node-ip=10.0.0.2 --flannel-iface=wg0" sh -

#Configuration of K3S
#Create a directory in systemd
#sudo mkdir /etc/systemd/system/k3s-agent.service.d

#Building network.conf
#chmod +x k3s_config.sh 
#./k3s_config.sh

#Copy the network.conf in /etc/systemd/system/k3s.service.d
#sudo cp node-ip.conf /etc/systemd/system/k3s-agent.service.d/node-ip.conf

#Restart k3s systemd service:
#sudo systemctl daemon-reload && systemctl restart k3s-agent.service

#Check nodes
sudo kubectl get nodes