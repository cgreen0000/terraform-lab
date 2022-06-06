# terraform-lab
Terraform project for testing systems in my homelab.

This project currently only targets Proxmox. The templates used can be built using my [packer-builds](https://github.com/cgreen0000/packer-builds) repository. It will currently build two Ubuntu 2204 VMs and two Windows Server 2022 VMs. 

You will need to provide the following variables to connect to your Proxmox instance:

    proxmox_api_url = "https://your.proxmox.fqdn:8006/api2/json"
    proxmox_api_token_id = "useraccount@node!token-name"
    proxmox_api_token_secret = "your_api_token_secret"