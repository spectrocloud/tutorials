aws_ssh_key_name        = "palette-key"
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
