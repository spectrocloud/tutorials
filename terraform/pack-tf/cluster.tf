resource "spectrocloud_cluster_aws" "cluster" {
  name              = var.cluster_name
  tags              = var.tags
  cloud_account_id  = data.spectrocloud_cloudaccount_aws.account.id
  depends_on        = [spectrocloud_cluster_profile.profile]

  cloud_config {
    ssh_key_name = var.ssh_key_name         
    region       = var.aws_region_name
  }
  
  cluster_profile {
    id = spectrocloud_cluster_profile.profile.id
  }

  scan_policy {
    configuration_scan_schedule = "0 0 * * SUN"
    penetration_scan_schedule   = "0 0 * * SUN"
    conformance_scan_schedule   = "0 0 1 * *"
  }

  ##############################
  # master-pool
  ##############################
  machine_pool {
    additional_labels = {
      "owner"   = "docs"
      "purpose" = "tutorial"
      "type"    = "master"
    }
    control_plane           = true
    control_plane_as_worker = true
    name                    = "master-pool"
    count                   = 1
    instance_type           = "m4.large"
    disk_size_gb            = 60
    azs                     = ["us-east-2a"]     
  }

  ##############################
  # worker-pool
  ##############################
  machine_pool {
    additional_labels = {
      "owner"   = "docs"
      "purpose" = "tutorial"
      "type"    = "worker"
    }
    name          = "worker-basic"
    count         = 1
    instance_type = "m5.large"
    azs           = ["us-east-2a"]
  }

}