provider "vsphere" {
  user           = "administrator@vsphere.local"
  password       = "Aa123456!@"
  vsphere_server = "vcsa.dev.local"
  allow_unverified_ssl = true
}