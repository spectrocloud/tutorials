cluster_profile         = "tf-gcp-profile"
region                  = "us-east1"

master_nodes = {
    count            = "1"
    instance_type    = "n1-standard-2"
    disk_size_gb     = "50"
    availability_zones = ["us-east1-b"]
}

worker_nodes = {
    count            = "1"
    instance_type    = "n1-standard-2"
    disk_size_gb     = "50"
    availability_zones = ["us-east1-b"]
}
