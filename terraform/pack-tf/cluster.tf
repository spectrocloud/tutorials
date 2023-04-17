resource "spectrocloud_cluster_aws" "cluster" {
  name              = var.cluster_name
  tags              = ["pack_tutorial", "docs"]
  cloud_account_id  = data.spectrocloud_cloudaccount_aws.account.id
  depends_on        = [spectrocloud_cluster_profile.profile]

  cloud_config {
    ssh_key_name = var.ssh_key_name         
    region       = var.aws_region_name      
    # vpc_id      = "vpc-0a38a86f3bf3c6cf5"                    # Dynamic placement    
  }
  
  cluster_profile {
    id = spectrocloud_cluster_profile.profile.id
  }

  # Optional
  # backup_policy {
    # schedule                  = "0 0 * * SUN"
    # backup_location_id        = data.spectrocloud_backup_storage_location.bsl.id
    # prefix                    = "prod-backup"
    # expiry_in_hour            = 7200
    # include_disks             = true
    # include_cluster_resources = true
  # }

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
    azs                     = ["us-east-2a"]     # ["eu-east-2a","eu-west-2b"]
    # Syntax for specifying AZs in static deployment. 
    # az_subnets = {
    #   "eu-west-1c" = "subnet-039c3beb3da69172f"
    #   "eu-west-1a" = "subnet-04dbeac9aba098d0e"
    # }
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