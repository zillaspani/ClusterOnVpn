#!/bin/bash

# Lista dei file da eliminare
files_to_delete=(
    "/snap/core20/1974/usr/lib/python3/dist-packages/cloudinit/config/cc_wireguard.py"
    "/snap/core20/1974/usr/lib/python3/dist-packages/cloudinit/config/__pycache__/cc_wireguard.cpython-38.pyc"
    "/snap/core20/2105/usr/lib/python3/dist-packages/cloudinit/config/cc_wireguard.py"
    "/snap/core20/2105/usr/lib/python3/dist-packages/cloudinit/config/__pycache__/cc_wireguard.cpython-38.pyc"
    "/usr/lib/modules/6.2.0-26-generic/kernel/drivers/net/wireguard"
    "/usr/lib/modules/6.2.0-39-generic/kernel/drivers/net/wireguard"
    "/usr/share/doc/netplan/examples/wireguard.yaml"
    "/usr/src/linux-hwe-6.2-headers-6.2.0-26/drivers/net/wireguard"
    "/usr/src/linux-hwe-6.2-headers-6.2.0-26/include/uapi/linux/wireguard.h"
    "/usr/src/linux-hwe-6.2-headers-6.2.0-26/tools/testing/selftests/wireguard"
    "/usr/src/linux-hwe-6.2-headers-6.2.0-39/drivers/net/wireguard"
    "/usr/src/linux-hwe-6.2-headers-6.2.0-39/include/uapi/linux/wireguard.h"
    "/usr/src/linux-hwe-6.2-headers-6.2.0-39/tools/testing/selftests/wireguard"
    "/var/lib/dpkg/info/wireguard-tools.list"
    "/var/lib/dpkg/info/wireguard-tools.postrm"
)

# Elimina i file
for file in "${files_to_delete[@]}"; do
    if [ -e "$file" ]; then
        rm -rf "$file"
        echo "Il file $file è stato eliminato."
    else
        echo "Il file $file non esiste."
    fi
done

echo "Eliminazione completata."