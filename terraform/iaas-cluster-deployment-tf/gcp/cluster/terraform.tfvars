cluster_profile         = "tf-gcp-profile"
region                  = "us-east1"

master_nodes = {
    count            = "1"
    instance_type    = "n1-standard-4"
    disk_size_gb     = "60"
    availability_zones = ["us-east1-b"]
}

worker_nodes = {
    count            = "2"
    instance_type    = "n1-standard-4"
    disk_size_gb     = "60"
    availability_zones = ["us-east1-b"]
}
