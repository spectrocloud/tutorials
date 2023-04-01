spectrocloud_api_key    = "j54xxxxxxxxxxxxxxxxxxxxxxxxxxxx"
aws_ssh_key_name        = "aws-key"
aws-cloud-account-name  = "82xxxxxxxxxx"
cluster_profile         = "tf-aws-profile"
region                  = "us-east-1"
master_nodes = {
    count           = "1"
    instance_type   = "m5.large"
    disk_size_gb    = "60"
    availability_zones = ["us-east-1a"]
}
worker_nodes = {
    count           = "2"
    instance_type   = "m5.large"
    disk_size_gb    = "60"
    availability_zones = ["us-east-1a"]
}