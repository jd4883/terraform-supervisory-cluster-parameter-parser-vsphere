locals {
  supervisory_cluster = {
    Master_DNS_names                           = var.master_dns_names
    cluster_proxy_config                       = var.cluster_proxy_config
    default_image_registry                     = var.default_image_registry
    default_image_repository                   = var.default_image_repository
    default_kubernetes_service_content_library = data.vsphere_content_library.default_kubernetes_service_content_library.id
    ephemeral_storage_policy                   = data.vsphere_storage_policy.ephemeral_storage_policy.id
    image_storage                              = { storage_policy = data.vsphere_storage_policy.image_storage_policy.id }
    login_banner                               = var.login_banner
    master_DNS                                 = var.dns_servers
    master_DNS_search_domains                  = var.dns_search_domains
    master_NTP_servers                         = var.ntp_servers
    master_storage_policy                      = data.vsphere_storage_policy.master_storage_policy.id
    network_provider                           = var.network_provider
    size_hint                                  = var.size_hint
    worker_DNS                                 = var.dns_servers
    load_balancer_config_spec = {
      address_ranges = var.load_balancer_address_ranges
      ha_proxy_config_create_spec = {
        certificate_authority_chain = var.certificate_authority_chain
        password                    = var.ha_proxy_password
        servers                     = var.ha_proxy_servers
        username                    = var.ha_proxy_username
      }
      id       = var.ha_proxy_dns_shortname
      provider = var.load_balaner_provider
    }
    master_management_network = {
      address_range = var.master_management_network_address_range
      floating_IP   = var.master_management_network_floating_ip
      mode          = var.master_management_network_mode
      network       = data.vsphere_network.managament.id
    }
    service_cidr = var.service_cidr
    workload_networks_spec = {
      supervisor_primary_workload_network = {
        network          = data.vsphere_network.workload.id
        network_provider = var.network_provider
        vsphere_network = {
          ip_assignment_mode = var.workload_management_network_mode
          portgroup          = var.workload_portgroup
        }
      }
    }
    workload_ntp_servers = var.ntp_servers
  }
}
