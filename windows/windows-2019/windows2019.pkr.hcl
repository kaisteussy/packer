source "vsphere-iso" "windows2019" {
  CPUs                 = 2
  RAM                  = 4096
  RAM_reserve_all      = false
  communicator         = "winrm"
  convert_to_template  = "true"
  datacenter           = "${var.vsphere-datacenter}"
  datastore            = "${var.vsphere-datastore}"
  disk_controller_type = ["pvscsi"]
  firmware             = "bios"
  floppy_files         = ["autounattend.xml"]
  guest_os_type        = "windows9Server64Guest"
  insecure_connection  = "true"
  iso_paths            = ["${var.iso_paths}"]
  network_adapters {
    network      = "${var.vsphere-network}"
    network_card = "vmxnet3"
  }
  password         = "${var.vsphere-password}"
  shutdown_command = "shutdown /s /t 5"
  storage {
    disk_size             = 15000
    disk_thin_provisioned = true
  }
  username       = "${var.vsphere-user}"
  vcenter_server = "${var.vsphere-server}"
  vm_name        = "${var.vm-name}"
  host           = "${var.vsphere-host}"
  winrm_password = "vagrant"
  winrm_timeout  = "1h30m"
  winrm_username = "vagrant"
}

# a build block invokes sources and runs provisioning steps on them. The
# documentation for build blocks can be found here:
# https://www.packer.io/docs/templates/hcl_templates/blocks/build
build {
  sources = ["source.vsphere-iso.windows2019"]

  provisioner "windows-shell" {
    inline = ["ipconfig /all"]
  }

}
