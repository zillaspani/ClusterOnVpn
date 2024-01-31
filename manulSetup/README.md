To setup manually Master and Agents:
Follow these steps:

1. From the master node:
   1. Give the executuion permession at the script `script.sh` in the `setupMaster/wireguard` folder.
   ```
   chmod +x setup.sh
   ```
   2. Run the script `setupMaster/wireguard/setup.sh`
   3. Give the executuion permession at the script `script.sh` in the `setupMaster/k3s` folder. As specified at step 'i'.
   4. Run the script
   5. Retrieve the k3s token, you will need it in the next steps. To do it:
   ```
   sudo cat /var/lib/rancher/k3s/server/node-token
   ```

2. From the agent node:
   1. Give the executuion permession at the script `script.sh` in the `setupAgent/wireguard` folder.
   ```
   chmod +x setup.sh
   ```
   2. Run the script `setupAgent/wireguard/setup.sh`
   
3. From the master node:
   1. Give the executuion permession at the script `addClient.sh` in the `setuMaster/wireguard` folder.
   ```
   chmod +x setup.sh
   ```
   2. Run the script `setupMaster/wireguard/setup.sh`

4. From the agent node:
   1. Give the executuion permession at the script `script.sh` in the `setupAgent/k3s` folder.
   ```
   chmod +x setup.sh
   ```
   2. Run the script `setupAgent/wireguard/setup.sh`





4. Give the executuion permession at the script `script.sh` in the `setupAgent/k3s` folder. As specified at `i` step.
5. Run the script `setupAgent/k3s/setup.sh`
   
    

2. Now you need to know for your master.
   1. Agent's ip address in the wireguard network
   2. Agent's Wireguard  