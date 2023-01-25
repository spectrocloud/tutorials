resource "spectrocloud_virtual_cluster" "cluster" {
  name = var.scenario-one-cluster-name

  cluster_group_uid = data.spectrocloud_cluster_group.beehive.id
# cluster_group_uid = "635669ba4583891d109fe6c0" // HARDCODED due to bug

  resources {
    max_cpu       = 4
    max_mem_in_mb = 4096
    min_cpu       = 0
    min_mem_in_mb = 0
    max_storage_in_gb = "2"
    min_storage_in_gb = "0"
  }

  tags = ["scenario-1"]
}