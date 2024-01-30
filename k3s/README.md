# Automated build of HA k3s Cluster with `kube-vip` and MetalLB


This is based on the work from [this fork](https://github.com/212850a/k3s-ansible) which is based on the work from [k3s-io/k3s-ansible](https://github.com/k3s-io/k3s-ansible). It uses [kube-vip](https://kube-vip.io/) to create a load balancer for control plane, and [metal-lb](https://metallb.universe.tf/installation/) for its service `LoadBalancer`.

## ✅ System requirements

- Control Node (the machine you are running `ansible` commands) must have Ansible 2.11+ If you need a quick primer on Ansible [you can check out my docs and setting up Ansible](https://technotim.live/posts/ansible-automation/).

- You will also need to install collections that this playbook uses by running `ansible-galaxy collection install -r ./collections/requirements.yml` (important❗)

- [`netaddr` package](https://pypi.org/project/netaddr/) must be available to Ansible. If you have installed Ansible via apt, this is already taken care of. If you have installed Ansible via `pip`, make sure to install `netaddr` into the respective virtual environment.

- `server` and `agent` nodes should have passwordless SSH access, if not you can supply arguments to provide credentials `--ask-pass --ask-become-pass` to each command.

## 🚀 Getting Started

### 🍴 Preparation

First create a new directory based on the `my-cluster1` directory within the `inventory` directory:

```bash
cp -R inventory/my-cluster1 inventory/my-new-cluster
```

Second, edit `inventory/my-cluster/hosts.ini` to match the system information gathered above

For example:

```ini
[master]
1.1.1.128

[node]
1.1.1.129
1.1.1.130

[k3s_cluster:children]
master
node
```

If multiple hosts are in the master group, the playbook will automatically set up k3s in [HA mode with etcd](https://rancher.com/docs/k3s/latest/en/installation/ha-embedded/).
Be carefull with this, this configuration it wasn't tested yes with the VPN over the nodes. Use only if you don't care to use VPN and you just need a k3s cluster.

Go to the `ansible.cfg` and adapt the inventory path to match the files that you just created.

This requires at least k3s version `1.19.1` however the version is configurable by using the `k3s_version` variable.

If needed, you can also edit `inventory/my-cluster1/group_vars/all.yml` to match your environment, inside it you will find all the explaination.

### ☸️ Create Cluster

Start provisioning of the cluster using the following command:

```bash
ansible-playbook site.yml -i inventory/my-cluster/hosts.ini --ask-pass --ask-become-pass
```

After deployment control plane will be accessible via virtual ip-address which is defined in inventory/group_vars/all.yml as `apiserver_endpoint`

### 🔥 Remove k3s cluster

```bash
ansible-playbook reset.yml -i inventory/my-cluster/hosts.ini --ask-pass --ask-become-pass
```

>You should also reboot these nodes due to the VIP not being destroyed

## ⚙️ Kube Config

To copy your `kube config` locally so that you can access your **Kubernetes** cluster run:

```bash
scp <user>@master_ip:~/.kube/config ~/.kube/config
```

### 🔨 Testing your cluster

See the commands [here](https://technotim.live/posts/k3s-etcd-ansible/#testing-your-cluster).

## Thanks 🤝

This repo is really standing on the shoulders of giants. Thank you to all those who have contributed and thanks to these repos for code and ideas:

- [k3s-io/k3s-ansible](https://github.com/k3s-io/k3s-ansible)
- [geerlingguy/turing-pi-cluster](https://github.com/geerlingguy/turing-pi-cluster)
- [212850a/k3s-ansible](https://github.com/212850a/k3s-ansible)
