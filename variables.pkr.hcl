variable "box_out_dir" {
  type    = string
  default = "./dist/"
}

variable "cpu" {
  type    = string
  default = "2"
}

variable "disk_size" {
  type    = string
  default = "200000"
}

variable "hyperv_switchname" {
  type    = string
  default = "WSL"
}

variable "initrd" {
  type    = string
  default = "/casper/initrd"
}

variable "iso_checksum_type" {
  type    = string
  default = "sha256"
}

variable "iso_checksum" {
  type    = string
  default = "443511f6bf12402c12503733059269a2e10dec602916c0a75263e5d990f6bb93"
}
variable "iso_checksum_url" {
  type    = string
  default = "sha512:353758585dce42a098944a5ffc8704bd6597b96e0b136342040292a11a8c1cb674e3f1cea97ff77135b3aa8eca939d765adeb49602ea72fa08f02ad898b3f073"
}

variable "iso_url" {
  type    = string
  default = "https://releases.ubuntu.com/22.04/ubuntu-22.04-live-server-amd64.iso"
}

variable "keyboard_layout" {
  type    = string
  default = "us"
}

variable "locale" {
  type    = string
  default = "en_US.UTF-8"
}

variable "output_directory" {
  type    = string
  default = "./output/ubuntu-20.04/"
}

variable "output_name" {
  type    = string
  default = "ubuntu"
}

variable "password" {
  type    = string
  default = "ubuntu"
}

variable "crypted_password" {
  type        = string
  description = "openssl passwd -6 password. must match password from above"
  default     = "ubuntu" #vagrant
}

variable "ram_size" {
  type    = string
  default = "4096"
}

variable "username" {
  type    = string
  default = "ubuntu"
}

variable "vm_name" {
  type    = string
  default = "ubuntu"
}

variable "vmlinuz" {
  type    = string
  default = "/casper/vmlinuz"
}
variable "input_directory" {
  type    = string
  default = "./output/ubuntu-20.04/"
}
variable "input_name" {
  type    = string
  default = "ubuntu-20.04"
}

variable "timezone_region" {
  type    = string
  default = "Australia"
}

variable "timezone_city" {
  type    = string
  default = "Sydney"
}