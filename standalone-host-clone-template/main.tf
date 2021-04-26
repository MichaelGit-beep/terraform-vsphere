data "vsphere_datacenter" "datacenter" {
  name = "${var.vm["datacenter"]}"
}

data "vsphere_resource_pool" "pool" {
  name          = "${var.vm["resource_poolr"]}"
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.vm["datastore"]}"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = "${var.vm["vm_networkr"]}"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name          = "${var.vsphere["template_name"]"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "vm" {
  count            = "${var.vm["count"]}"
  name             = "${var.vm["name_prefix"]}${count.index + 1}"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  folder           = "${var.vm["folder_name"]}"
  num_cpus         = 2
  memory           = 4096
  guest_id         = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type        = "${data.vsphere_virtual_machine.template.scsi_type}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "Hard disk 1"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      windows_options {
        computer_name  = "${var.vm["name_prefix"]}${count.index + 1}"
        workgroup      = "${var.vm["workgroup"]}"
        admin_password = "${var.vm["admin_password"]}"
      }

      network_interface {
        ipv4_address = "${var.vm["subnet_prefix"]}${100 + count.index}"
        ipv4_netmask = 24
      }

      ipv4_gateway = "${var.vm["ipv4_gateway"]}"
    }
  }
}