aws-cloud-account-name  = "82xxxxxxxxxx"
region                  = "us-east-1"
master_nodes = {
    count           = "1"
    instance_type   = "m5.large"
    disk_size_gb    = "60"
    availability_zones = ["us-east-1a"]
}
worker_nodes = {
    count           = "1"
    instance_type   = "m5.large"
    disk_size_gb    = "60"
    availability_zones = ["us-east-1a"]
}

ssh_key_name            = "aws-key"
ssh_public_key          = "<your ssh key>"
aws_access_key          = "<your access key>"
aws_secret_access_key   = "<your secret key>"