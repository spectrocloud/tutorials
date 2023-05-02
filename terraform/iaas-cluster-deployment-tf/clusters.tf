#########################
# AWS Cluster Profile
########################
resource "spectrocloud_cluster_aws" "aws-cluster" {
  count = var.deploy-aws ? 1 : 0

  name             = "aws-cluster"
  tags             = concat(var.tags, ["aws"])
  cloud_account_id = data.spectrocloud_cloudaccount_aws.account[0].id

  cloud_config {
    region       = var.aws-region
    ssh_key_name = var.aws-key-pair-name
  }

  cluster_profile {
    id = spectrocloud_cluster_profile.aws-profile[0].id
  }

  machine_pool {
    control_plane           = true
    control_plane_as_worker = true
    name                    = "master-pool"
    count                   = var.aws_master_nodes.count
    instance_type           = var.aws_master_nodes.instance_type
    disk_size_gb            = var.aws_master_nodes.disk_size_gb
    azs                     = var.aws_master_nodes.availability_zones
  }

  machine_pool {
    name          = "worker-pool"
    count         = var.aws_worker_nodes.count
    instance_type = var.aws_worker_nodes.instance_type
    disk_size_gb  = var.aws_worker_nodes.disk_size_gb
    azs           = var.aws_worker_nodes.availability_zones
  }

  timeouts {
    create = "30m"
    delete = "15m"
  }
}
#########################
# Azure Cluster Profile
#########################
resource "spectrocloud_cluster_azure" "cluster" {
  count = var.deploy-azure ? 1 : 0

  name             = "azure-cluster"
  tags             = concat(var.tags, ["azure"])
  cloud_account_id = data.spectrocloud_cloudaccount_azure.account[0].id

  cloud_config {
    subscription_id = var.azure_subscription_id
    resource_group  = var.azure_resource_group
    region          = var.azure-region
    ssh_key         = var.azure-key-pair-name
  }

  cluster_profile {
    id = spectrocloud_cluster_profile.azure-profile[0].id
  }

  machine_pool {
    control_plane           = true
    control_plane_as_worker = true
    name                    = "master-pool"
    count                   = var.azure_master_nodes.count
    instance_type           = var.azure_master_nodes.instance_type
    azs                     = var.azure_master_nodes.availability_zones
    is_system_node_pool     = var.azure_master_nodes.is_system_node_pool
    disk {
      size_gb = var.azure_master_nodes.disk_size_gb
      type    = "Standard_LRS"
    }
  }

  machine_pool {
    name                = "worker-basic"
    count               = var.azure_worker_nodes.count
    instance_type       = var.azure_worker_nodes.instance_type
    azs                 = var.azure_worker_nodes.availability_zones
    is_system_node_pool = var.azure_worker_nodes.is_system_node_pool
  }

  timeouts {
    create = "30m"
    delete = "15m"
  }
}

#########################
# GCP Cluster Profile
#########################
resource "spectrocloud_cluster_gcp" "gcp-cluster" {
  count = var.deploy-gcp ? 1 : 0

  name             = "gcp-cluster"
  tags             = concat(var.tags, ["gcp"])
  cloud_account_id = data.spectrocloud_cloudaccount_gcp.account[0].id

  cloud_config {
    project = var.gcp-cloud-account-name
    region  = var.gcp-region
  }

  cluster_profile {
    id = spectrocloud_cluster_profile.gcp-profile[0].id
  }

  machine_pool {
    control_plane           = true
    control_plane_as_worker = true
    name                    = "master-pool"
    count                   = var.gcp_master_nodes.count
    instance_type           = var.gcp_master_nodes.instance_type
    disk_size_gb            = var.gcp_master_nodes.disk_size_gb
    azs                     = var.gcp_master_nodes.availability_zones
  }

  machine_pool {
    name          = "worker-pool"
    count         = var.gcp_worker_nodes.count
    instance_type = var.gcp_worker_nodes.instance_type
    disk_size_gb  = var.gcp_worker_nodes.disk_size_gb
    azs           = var.gcp_worker_nodes.availability_zones
  }

  timeouts {
    create = "30m"
    delete = "15m"
  }
}