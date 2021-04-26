provider "vsphere" {
  user           = var.vsphere["vsphere_user"]
  password       = var.vsphere["vsphere_password"]
  vsphere_server = var.vsphere["vsphere_address"]

  # If you have a self-signed cert
  allow_unverified_ssl = true
}
