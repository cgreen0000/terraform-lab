resource "proxmox_vm_qemu" "win2022-vm" {
  count = 2
  target_node = "pve"
  name = "win2022-vm-${count.index + 1}"
  desc = "Windows Server 2022 VM created by terraform"

  # Don't start the VM when booting the hypervisor.
  onboot = false 

  clone = "Windows-Server-2022-Template"

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

  # Start at ip 192.168.1.160 and count up.
  ipconfig0 = "ip=192.168.1.16${count.index}/24,gw=192.168.1.1"
  nameserver = "192.168.1.1"
}