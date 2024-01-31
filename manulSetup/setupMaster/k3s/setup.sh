#Installation of K3S
sudo curl -sfL https://get.k3s.io | sh -

#Configuration of K3S
#Create a directory in systemd
sudo mkdir /etc/systemd/system/k3s.service.d

#Building network.conf
chmod +x k3s_config.sh 
./k3s_config.sh

#Copy the network.conf in /etc/systemd/system/k3s.service.d
sudo cp network.conf /etc/systemd/system/k3s.service.d/network.conf

#Restart k3s systemd service:
sudo systemctl daemon-reload && systemctl restart k3s.service

#Check nodes
sudo kubectl get nodes