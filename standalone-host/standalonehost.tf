data "vsphere_datacenter" "datacenter" {
  name = "Datacenter"
}

data "vsphere_resource_pool" "pool" {
  name          = "resource-pool-1"
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
}

data "vsphere_datastore" "datastore" {
  name          = "Datastore"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}


resource "vsphere_virtual_machine" "vm" {
  name             = "VM"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  folder           = "Discovered virtual machine"
  num_cpus         = 2
  memory           = 4096

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
  }

  disk {
    label            = "Hard disk 1"
    size             = "20"
  }
}