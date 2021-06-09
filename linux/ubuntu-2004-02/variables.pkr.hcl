variable "host" {
  type    = string
  default = "10.1.60.7"
}

variable "iso_checksum" {
  type    = string
  default = "d1f2bf834bbe9bb43faf16f9be992a6f3935e65be0edece1dee2aa6eb1767423"
}

variable "iso_paths" {
  type    = string
  default = "[mcrhost75c-Datastore] ISOs/ubuntu-20.04.2-live-server-amd64.iso"
}

variable "iso_urls" {
  type    = string
  default = "https://releases.ubuntu.com/20.04/ubuntu-20.04.2-live-server-amd64.iso"
}

variable "vm-cpu-num" {
  type    = string
  default = "1"
}

variable "vm-disk-size" {
  type    = string
  default = "25600"
}

variable "vm-mem-size" {
  type    = string
  default = "1024"
}

variable "vm-name" {
  type    = string
  default = "ubuntu-20-04-02"
}

variable "vsphere-datacenter" {
  type    = string
  default = "Dallas RO"
}

variable "vsphere-datastore" {
  type    = string
  default = "mcrhost75c-Datastore"
}

variable "vsphere-network" {
  type    = string
  default = "VM Network"
}

variable "vsphere-password" {
  type    = string
}

variable "vsphere-server" {
  type    = string
}

variable "vsphere-user" {
  type    = string
}
