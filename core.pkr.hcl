packer {
  required_plugins {
    hyperv = {
      version = ">= 1.0.4"
      source  = "github.com/hashicorp/hyperv"
    }
  }
}

source "hyperv-iso" "ubuntu" {
  boot_command = ["<esc><esc><esc><esc><wait>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><enter>",
    "linux /casper/vmlinuz --- autoinstall ds=\"nocloud-net;seedfrom=http://{{.HTTPIP}}:{{.HTTPPort}}/\"<enter><wait>",
    "initrd /casper/initrd<enter><wait>",
    "boot<enter>",
    "<enter><f10><wait>"
  ]
  boot_wait            = "3s"
  communicator         = "ssh"
  headless             = false
  cpus                 = var.cpu
  disk_size            = var.disk_size
  enable_secure_boot   = false
  generation           = 2
  guest_additions_mode = "disable"
  http_directory       = "./http"
  output_directory     = "output/live-server"
  iso_url              = "https://releases.ubuntu.com/22.04/ubuntu-22.04-live-server-amd64.iso"
  iso_checksum         = var.iso_checksum
  memory               = var.ram_size
  shutdown_command     = "echo '${var.username}' | sudo -S shutdown -P now"
  ssh_password         = var.password
  ssh_timeout          = "4h"
  ssh_username         = var.username
  #not used currently
  #ssh_private_key_file = "./keys/id_rsa"
  switch_name          = var.hyperv_switchname
  vm_name              = var.vm_name

}
# Builds Hyper-V image.
build {
  sources = ["source.hyperv-iso.ubuntu"]

  provisioner "shell" {
    inline = ["while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting for cloud-init...'; sleep 1; done"]
  }
}