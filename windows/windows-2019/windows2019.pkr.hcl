source "vsphere-iso" "windows2019" {
  username             = "${var.vsphere-user}"
  vcenter_server       = "${var.vsphere-server}"
  communicator         = "winrm"
  host                 = "${var.vsphere-host}"
  winrm_password       = "${var.winadmin-password}"
  winrm_timeout        = "1h30m"
  winrm_username       = "Administrator"


  CPUs                 = 2
  RAM                  = 4096
  RAM_reserve_all      = true

  convert_to_template  = "true"
  datacenter           = "${var.vsphere-datacenter}"
  datastore            = "${var.vsphere-datastore}"
  disk_controller_type = ["lsilogic-sas"]
  firmware             = "bios"
  iso_paths            = ["${var.iso_paths}", "[] /vmimages/tools-isoimages/windows.iso"]
  floppy_files         = ["autounattend.xml",
                          "scripts/disable-network-discovery.cmd",
                          "scripts/disable-server-manager.ps1",
                          "scripts/enable-rdp.cmd",
                          "scripts/enable-winrm.ps1",
                          "scripts/install-vm-tools.cmd",
                          "scripts/set-temp.ps1"]
  vm_name              = "${var.vm-name}"
  guest_os_type        = "windows9Server64Guest"
  insecure_connection  = "true"

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
