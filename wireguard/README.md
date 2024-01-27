# WireGuard VPN Setup with Ansible

## Purpose

Basic Ansible playbook for deploying a WireGuard VPN server and remote client.

## Usage
For setting properly your server you need to generate the keys pair of WG

1. Generate your own WireGuard keys

    ```
    privkey=$(wg genkey) sh -c 'echo "
        server_privkey: $privkey
        server_pubkey: $(echo $privkey | wg pubkey)"'
    ```

2. Encrypt the private key (hit Ctrl-d twice after pasting key in the prompt)

    ```
    ansible-vault encrypt_string --ask-vault-password --stdin-name server_privkey
    ```

3. Add the public key and the encrypted private key to `group_vars/all.yml`

4. Add the wireguard subnetwork with subnet mask and the port where you want listen

5. Change the server and client IP address and the other fields in `inventory.ini`
6. Change the path specified in `playbook.yml`, open to undestand better

7. Run the playbook

    ```
    ansible-playbook -i inventory.ini --ask-vault-password  playbook.yml --ask-pass --ask-become-pass
    ```
