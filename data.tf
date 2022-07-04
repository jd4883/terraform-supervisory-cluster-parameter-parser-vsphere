data "vsphere_content_library" "default_kubernetes_service_content_library" { name = var.default_kubernetes_service_content_library }
data "vsphere_storage_policy" "ephemeral_storage_policy" { name = var.ephemeral_storage_policy }
data "vsphere_storage_policy" "master_storage_policy" { name = var.master_storage_policy }
data "vsphere_storage_policy" "image_storage_policy" { name = var.image_storage_policy }
data "vsphere_datacenter" "dc" { name = var.datacenter }

data "vsphere_compute_cluster" "compute_cluster" {
  datacenter_id = data.vsphere_datacenter.dc.id
  name          = var.cluster
}

data "vsphere_network" "managament" {
  datacenter_id = data.vsphere_datacenter.dc.id
  name          = var.management_network
}

data "vsphere_network" "workload" {
  datacenter_id = data.vsphere_datacenter.dc.id
  name          = var.workload_network
}
