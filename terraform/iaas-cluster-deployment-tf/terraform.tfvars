###########################
# AWS Deployment Settings
############################
deploy-aws = false # Set to true to deploy to Azure

aws-cloud-account-name = "REPLACE_ME"
aws-region             = "REPLACE_ME"
aws-key-pair-name      = "REPLACE_ME"

aws_master_nodes = {
  count              = "1"
  instance_type      = "m4.2xlarge"
  disk_size_gb       = "60"
  availability_zones = ["REPLACE ME"]
}

aws_worker_nodes = {
  count              = "1"
  instance_type      = "m4.2xlarge"
  disk_size_gb       = "60"
  availability_zones = ["REPLACE ME"]
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

###########################
# GCP Deployment Settings
############################
deploy-gcp = false # Set to true to deploy to GCP

gcp-cloud-account-name = "REPLACE_ME"
gcp-region             = "REPLACE_ME"

gcp_master_nodes = {
  count              = "1"
  instance_type      = "n1-standard-4"
  disk_size_gb       = "60"
  availability_zones = ["REPLACE ME"]
}

gcp_worker_nodes = {
  count              = "1"
  instance_type      = "n1-standard-4"
  disk_size_gb       = "60"
  availability_zones = ["REPLACE ME"]
}