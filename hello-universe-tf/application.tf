##########################################
# Scenario 1: Single Application
##########################################
# resource "spectrocloud_application" "hello-universe-ui" {
#   name                    = "hello-universe-ui"
#   application_profile_uid = spectrocloud_application_profile.hello-universe-ui.id

#   config {
#     cluster_name      = spectrocloud_virtual_cluster.cluster-1.name
#     cluster_uid = spectrocloud_virtual_cluster.cluster-1.cluster_group_uid
#     limits {
#       cpu     = 4
#       memory  = 4096
#       storage = 2
#     }
#   }
#   tags = concat(var.tags, ["scenario-1"])
# }

##########################################
# Scenario 2: Multiple Applications
##########################################

# resource "spectrocloud_application" "hello-universe-ui" {
#   count = var.enable-second-scenario == true ? 1 : 0
#
#   name                    = "hello-universe"
#   application_profile_uid = spectrocloud_application_profile.hello-universe-complete.id

#   config {
#     cluster_name      = spectrocloud_virtual_cluster.cluster-2.name
#     cluster_uid = spectrocloud_virtual_cluster.cluster-2.cluster_group_uid
#     limits {
#       cpu     = 8
#       memory  = 12288
#       storage = 8
#     }
#   }
#   tags = concat(var.tags, ["scenario-2"])
# }