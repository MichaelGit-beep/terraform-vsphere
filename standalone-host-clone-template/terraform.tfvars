vsphere = {
  vsphere_server    =  "vcsa.dev.local"
  vsphere_user      =  "administrator@vsphere.local"
  vsphere_password  =  "Aa123456!@"
  datacenter        =  "Datacenter"
  datastore         =  "Datastore"
  resource_pool     =  "resource-pool-1"
  vm_network        =  "VM Network"
  template_name     =  "Template-1"
}

vm = {
  count             =   "1"
  name_prefix       =   "Machine"
  folder_name       =   "Clones"
  admin_password    =   "Aa123456!@"
  workgroup         =   "workgroup"
  subnet_prefix     =   "192.168.77."
  ipv4_gateway      =   "192.168.77.2"
}