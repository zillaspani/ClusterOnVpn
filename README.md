# Project Documentation: 
#K3s Cluster with Wireguard VPN
## Overview
This project involves the creation of a cluster of nodes using K3s, a lightweight Kubernetes distribution, with Wireguard employed as the VPN solution to connect these nodes securely. The goal of my work was setup a cluster of `edge devices` and ensuring the connection of them with a VPN connection. The repository includes two main folders, namely `k3s` and `Wireguard`, housing Ansible scripts for automating the setup of the cluster.
## Cluster sample
![Cluster sample](Scheme.jpg)

## Table of Contents
- [Project Documentation:](#project-documentation)
  - [Overview](#overview)
  - [Cluster sample](#cluster-sample)
  - [Table of Contents](#table-of-contents)
  - [Prerequisites](#prerequisites)
  - [Folder Structure](#folder-structure)
  - [Step 1: Wireguard VPN](#step-1-wireguard-vpn)
  - [Step 2: K3S Setup](#step-2-k3s-setup)
  - [Usage](#usage)
  - [Troubleshooting](#troubleshooting)
  - [Script Credits](#script-credits)
    - [Original Sources](#original-sources)
    - [Blog and others references](#blog-and-others-references)
  - [Contributing](#contributing)

## Prerequisites

Before proceeding with the setup, ensure the following prerequisites are met:
Ansible:
```
pip install ansible
```

## Folder Structure

- **k3s/**
  - [Description of contents and purpose]
- **wireguard/**
  - [Description of contents and purpose]

## Step 1: Wireguard VPN
[Wireguard setup](wireguard/README.md)

## Step 2: K3S Setup
[K3S setup](k3s/README.md)

## Usage

[Provide information on how to use and interact with the deployed K3s cluster.]

## Troubleshooting

[Include common issues and their solutions.]

## Script Credits
The scripts utilized in this project have been adapted and customized based on existing scripts to meet the specific requirements of the cluster setup. While the core functionalities may have originated from external sources, modifications and adaptations have been made to suit the needs of this project.

### Original Sources 
- https://github.com/Tangram-Vision/Tangram-Vision-Blog/tree/main/2021.03.04_AnsibleVpnSetup
- https://github.com/techno-tim/k3s-ansible
### Blog and others references
- https://technotim.live/posts/k3s-etcd-ansible/
- https://www.tangramvision.com/blog/exploring-ansible-via-setting-up-a-wireguard-vpn
- https://www.inovex.de/de/blog/how-to-set-up-a-k3s-cluster-on-wireguard/
- https://www.wireguard.com/quickstart/
- https://docs.k3s.io
## Contributing
Feel free to modify and improve everything, just let me know :)

