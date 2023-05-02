###########################
# AWS Deployment Settings
############################
deploy-aws = true # Set to true to deploy to AWS

aws-cloud-account-name = "spectro-cloud"
aws-region             = "us-east-1"
aws-key-pair-name      = "karls-ec2-keypair"

aws_master_nodes = {
  count              = "1"
  control_plane      = true
  instance_type      = "m4.2xlarge"
  disk_size_gb       = "60"
  availability_zones = ["us-east-1a"]
}

aws_worker_nodes = {
  count              = "1"
  control_plane      = false
  instance_type      = "m4.2xlarge"
  disk_size_gb       = "60"
  availability_zones = ["us-east-1a"]
}

###########################
# Azure Deployment Settings
############################
deploy-azure = false # Set to true to deploy to Azure

azure-cloud-account-name = "REPLACE_ME"
azure-region             = "REPLACE_ME"
azure-key-pair-name      = "REPLACE_ME"
azure_subscription_id    = "REPLACE_ME"
azure_resource_group     = "REPLACE_ME"


azure_master_nodes = {
  count               = "1"
  control_plane       = true
  instance_type       = "Standard_A8_v2."
  disk_size_gb        = "60"
  availability_zones  = ["1"]
  is_system_node_pool = false
}

azure_worker_nodes = {
  count               = "1"
  control_plane       = false
  instance_type       = "Standard_A8_v2."
  disk_size_gb        = "60"
  availability_zones  = ["1"]
  is_system_node_pool = false
}

###########################
# GCP Deployment Settings
############################
deploy-gcp = false # Set to true to deploy to GCP

gcp-cloud-account-name = "REPLACE_ME"
gcp-region             = "REPLACE_ME"

gcp_master_nodes = {
  count              = "1"
  control_plane      = true
  instance_type      = "n1-standard-4"
  disk_size_gb       = "60"
  availability_zones = ["REPLACE ME"]
}

gcp_worker_nodes = {
  count              = "1"
  control_plane      = false
  instance_type      = "n1-standard-4"
  disk_size_gb       = "60"
  availability_zones = ["REPLACE ME"]
}