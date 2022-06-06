resource "proxmox_vm_qemu" "test-vm" {
  count = 2
  target_node = "pve"
  name = "ubuntu-vm-${count.index + 1}"
  desc = "Ubuntu vm created by terraform"

  # Don't start the VM when booting the hypervisor.
  onboot = false 

  clone = "Ubuntu-22.04-Template"

  # Enables the qemu-guest-agent.
  agent = 1
  
  # VM CPU Settings
  memory = 1024
  cores = 1
  sockets = 1
  cpu = "host"    

  # VM Network Settings
  network {
      model  = "virtio"
      bridge = "vmbr0"
  }

  os_type = "cloud-init"

  # Start at ip 192.168.1.150 and count up.
  ipconfig0 = "ip=192.168.1.15${count.index}/24,gw=192.168.1.1"
  nameserver = "192.168.1.1"
}