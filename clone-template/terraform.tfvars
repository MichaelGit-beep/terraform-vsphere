vsphere = {
    vsphere_user        =   "administrator@vsphere.local"
    vsphere_password    =   "P@ssw0rd"
    vsphere_address     =   "bc-vcvms.briefcam.local"
    datacenter          =   "BC-vcvms"
    datastore           =   "DE400-VMS2"   
    cluster_name        =   "172.16.100.27"
    network_name        =   "VMS"
    template_name       =   "Vms2016-Temp"
}

vm = {
    cpu_count      =   "2"
    memory         =   "4096"
    folder_name    =   "Verint"
    name_prefix    =   "VMS"
    workgroup      = "workgroup"
    admin_password = "Aa123456!@"
    subnet_prefix  = "192.168.88."
    ipv4_gateway   = "192.168.88.2"
    count          = "1"
}