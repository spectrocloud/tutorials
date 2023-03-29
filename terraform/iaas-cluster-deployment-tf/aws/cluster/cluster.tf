data "spectrocloud_cloudaccount_aws" "account" {
  name = var.aws-cloud-account-name
}

data "spectrocloud_cluster_profile" "profile" {
  name = var.cluster_profile
}

resource "spectrocloud_cluster_aws" "cluster" {
  name             = "aws-cluster"
  tags             = ["aws", "tutorial"]
  cloud_account_id = data.spectrocloud_cloudaccount_aws.account.id

  cloud_config {
    region        = var.region
    ssh_key_name  = var.aws_ssh_key_name
  }

  cluster_profile {
    id = data.spectrocloud_cluster_profile.profile.id
  }

  machine_pool {
    control_plane           = true
    control_plane_as_worker = true
    name                    = "master-pool"
    count                   = var.master_nodes.count
    instance_type           = var.master_nodes.instance_type
    disk_size_gb            = var.master_nodes.disk_size_gb
    azs                     = var.master_nodes.availability_zones
  }

  machine_pool {
    name          = "worker-basic"
    count         = var.worker_nodes.count
    instance_type = var.worker_nodes.instance_type
    disk_size_gb  = var.worker_nodes.disk_size_gb
    azs           = var.worker_nodes.availability_zones
  }
}