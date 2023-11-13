cluster_cloud_account_aws_name = "REPLACE ME"   # Name of the cloud account added to your Palette project settings
aws_region_name                = "REPLACE ME"   # Use "us-east-1" or any other AWS region
aws_az_names                   = []             # Specify the AWS availability zone name, you want the cluster to be available in. By default, only one AZ will be selected. For example: ['us-east-1a', 'us-east-1b', 'us-east-1c'].
ssh_key_name                   = "REPLACE ME"   # Name of the SSH key available in the region where you will deploy the cluster
private_pack_registry          = "REPLACE ME"   # Your registry server name. This tutorial uses "private-pack-registry". 
use_oci_registry               = true           # Set the use of OCI registry to true or false. The default value is set as true.