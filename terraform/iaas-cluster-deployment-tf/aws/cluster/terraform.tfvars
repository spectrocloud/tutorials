spectrocloud_api_key    = "j54AsdjnSP2YU9jJF1K5dVYeURWzO4qd"
aws_ssh_key_name        = "palette-key"
aws-cloud-account-name  = "aws-palette"
cluster_profile         = "tf-aws-profile"
region                  = "us-east-1"

master_nodes = {
    count           = "1"
    instance_type   = "m5.large"
    disk_size_gb    = "50"
    availability_zones = ["us-east-1a"]
}

worker_nodes = {
    count           = "1"
    instance_type   = "m5.large"
    disk_size_gb    = "50"
    availability_zones = ["us-east-1a"]
} 