# This file was autogenerated by the 'packer hcl2_upgrade' command. We
# recommend double checking that everything is correct before going forward. We
# also recommend treating this file as disposable. The HCL2 blocks in this
# file can be moved to other files. For example, the variable blocks could be
# moved to their own 'variables.pkr.hcl' file, etc. Those files need to be
# suffixed with '.pkr.hcl' to be visible to Packer. To use multiple files at
# once they also need to be in the same folder. 'packer inspect folder/'
# will describe to you what is in that folder.

# Avoid mixing go templating calls ( for example ```{{ upper(`string`) }}``` )
# and HCL2 calls (for example '${ var.string_value_example }' ). They won't be
# executed together and the outcome will be unknown.

# All generated input variables will be of 'string' type as this is how Packer JSON
# views them; you can change their type later on. Read the variables type
# constraints documentation
# https://www.packer.io/docs/templates/hcl_templates/variables#type-constraints for more info.

# source blocks are generated from your builders; a source can be referenced in
# build blocks. A build block runs provisioner and post-processors on a
# source. Read the documentation for source blocks here:
# https://www.packer.io/docs/templates/hcl_templates/blocks/source
source "vsphere-iso" "autogenerated_1" {
  CPUs                 = 1
  RAM                  = 1024
  RAM_reserve_all      = false
  boot_command         = ["<enter><wait2><enter><wait><f6><esc><wait>", " autoinstall<wait2> ds=nocloud;", "<wait><enter>"]
  boot_wait            = "2s"
  cd_files             = ["./http/user-data", "./http/meta-data"]
  cd_label             = "cidata"
  convert_to_template  = true
  datacenter           = "${var.vsphere-datacenter}"
  datastore            = "${var.vsphere-datastore}"
  disk_controller_type = ["pvscsi"]
  guest_os_type        = "ubuntu64Guest"
  host                 = "${var.host}"
  insecure_connection  = "true"
  iso_checksum         = "${var.iso_checksum}"
  iso_paths            = ["${var.iso_paths}"]
  network_adapters {
    network      = "${var.vsphere-network}"
    network_card = "vmxnet3"
  }
  notes                  = "Build via Packer"
  password               = "${var.vsphere-password}"
  shutdown_command       = "echo 'ubnt'|sudo -S shutdown -P now"
  ssh_handshake_attempts = "100"
  ssh_password           = "ubnt"
  ssh_timeout            = "20m"
  ssh_username           = "ubnt"
  storage {
    disk_size             = 15000
    disk_thin_provisioned = true
  }
  username       = "${var.vsphere-user}"
  vcenter_server = "${var.vsphere-server}"
  vm_name        = "${var.vm-name}"
}

# a build block invokes sources and runs provisioning steps on them. The
# documentation for build blocks can be found here:
# https://www.packer.io/docs/templates/hcl_templates/blocks/build
build {
  sources = ["source.vsphere-iso.autogenerated_1"]

}
