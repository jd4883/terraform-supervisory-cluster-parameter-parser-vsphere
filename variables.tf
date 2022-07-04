variable "certificate_authority_chain" { type = string }
variable "cluster" { type = string }
variable "datacenter" { type = string }
variable "default_kubernetes_service_content_library" { type = string }
variable "ephemeral_storage_policy" { type = string }
variable "ha_proxy_servers" { type = list(object({ host = string, port = number })) }
variable "image_storage_policy" { type = string }
variable "load_balancer_address_ranges" { type = list(object({ address = string, count = number })) }
variable "management_network" { type = string }
variable "master_storage_policy" { type = string }
variable "service_cidr" { type = list(object({ address = string, prefix = number })) }
variable "workload_network" { type = string }
variable "workload_portgroup" { type = string }

variable "ha_proxy_password" {
  default = ""
  type    = string
}

variable "ha_proxy_username" {
  default = ""
  type    = string
}

variable "ntp_servers" {
  default = []
  type    = list(string)
}

variable "dns_search_domains" {
  default = []
  type    = list(string)
}

variable "dns_servers" {
  default = []
  type    = list(string)
}

variable "master_dns_names" {
  default = []
  type    = list(string)
}

variable "cluster_proxy_config" {
  default = { proxy_settings_source = "VC_INHERITED" }
  type    = map(string)
}

variable "default_image_registry" {
  default = {
    hostname = ""
    port     = 443
  }
  type = object(
    {
      hostname = string
      port     = number
    }
  )
}

variable "default_image_repository" {
  default = ""
  type    = string
}

variable "ha_proxy_dns_shortname" {
  default = "haproxy"
  type    = string
}

variable "load_balaner_provider" {
  default = "HA_PROXY"
  type    = string
}

variable "login_banner" {
  default = ""
  type    = string
}

variable "master_management_network_address_range" {
  default = {
    address_count    = 0
    gateway          = ""
    starting_address = ""
    subnet_mask      = ""
  }
  type = object(
    {
      address_count    = number
      gateway          = string
      starting_address = string
      subnet_mask      = string
    }
  )
}

variable "master_management_network_floating_ip" {
  default = ""
  type    = string
}

variable "master_management_network_mode" {
  default = "DHCP"
  type    = string
  validation {
    condition     = contains(["STATIC", "DHCP"], var.master_management_network_mode)
    error_message = "DHCP or STATIC are the valid selections here."
  }
}

variable "workload_management_network_mode" {
  default = "DHCP"
  type    = string
  validation {
    condition     = contains(["STATIC", "DHCP"], var.workload_management_network_mode)
    error_message = "DHCP or STATIC are the valid selections here."
  }
}

variable "network_provider" {
  default = "VSPHERE_NETWORK"
  type    = string
  validation {
    condition     = contains(["NSXT_CONTAINER_PLUGIN", "VSPHERE_NETWORK"], var.network_provider)
    error_message = "VSPHERE_NETWORK or NSXT_CONTAINER_PLUGIN are the valid selections here."
  }
}

variable "size_hint" {
  default = "TINY"
  type    = string
  validation {
    condition     = contains(["TINY", "SMALL", "MEDIUM", "LARGE"], var.size_hint)
    error_message = "VSPHERE_NETWORK or NSXT_CONTAINER_PLUGIN are the valid selections here."
  }
}
