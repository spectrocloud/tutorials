# resource "vsphere_virtual_machine" "edge-artifacts" {
#   name             = "edge-builder"
#   resource_pool_id = data.vsphere_resource_pool.default.id
#   datastore_id     = data.vsphere_datastore.datastore.id
#   num_cpus         = 4
#   memory           = 8192
#   guest_id         = "edge-linux-builder-64"
#   network_interface {
#     network_id = data.vsphere_network.network.id
#   }
#   disk {
#     label = "edge-builder-disk"
#     size  = "60"
#   }

#   ovf_deploy {
#     allow_unverified_ssl_cert = true
#     remote_ovf_url            = var.ubuntu_ova_url
#     disk_provisioning         = "thin"
#     ip_protocol               = "IPV4"
#     ip_allocation_policy      = "STATIC_MANUAL"
#     ovf_network_map = {
#       "Network 1" = data.vsphere_network.network.id
#       "Network 2" = data.vsphere_network.network.id
#     }
#   }

#   extra_config = {
#     "guestinfo.metadata"          = base64encode(templatefile("${path.module}/templates/metadata.yaml", local.templatevars))
#     "guestinfo.metadata.encoding" = "base64"
#     "guestinfo.userdata"          = base64encode(templatefile("${path.module}/templates/userdata.yaml", local.templatevars))
#     "guestinfo.userdata.encoding" = "base64"
#   }
# }