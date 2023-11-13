# IaaS Cluster Deployment


This Terraform code is explained in the [Deploy a Cluster](https://docs.spectrocloud.com/clusters/public-cloud/deploy-k8s-cluster) tutorial.

This Terraform code has three main toggle variables that you can use to deploy to one of the following cloud providers.

| Variable| Provider| Description| Default |
|---|---|---|---|
| `deploy-aws` | AWS | Enable to deploy a cluster to AWS. | `false`|
| `deploy-azure` | GCP | Enable to deploy a cluster to Azure. | `false`|
| `deploy-gcp` | Azure | Enable to deploy a cluster to GCP. | `false`|

> You can enable as many of the providers as you want. You just need to ensure all provider's required values are specified.

To get started, open up the file **terraform.tfvars**. Toggle the provider variable mentioned in the table and start providing values for the respective cloud provider. Make sure you specify a value to your cloud provider variables and replace all values containing the string `REPLACE ME`.


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_spectrocloud"></a> [spectrocloud](#requirement\_spectrocloud) | >= 0.13.1 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.0.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_spectrocloud"></a> [spectrocloud](#provider\_spectrocloud) | 0.13.1 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [spectrocloud_cluster_aws.aws-cluster](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_aws) | resource |
| [spectrocloud_cluster_azure.cluster](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_azure) | resource |
| [spectrocloud_cluster_gcp.gcp-cluster](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_gcp) | resource |
| [spectrocloud_cluster_profile.aws-profile](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_profile) | resource |
| [spectrocloud_cluster_profile.azure-profile](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_profile) | resource |
| [spectrocloud_cluster_profile.gcp-profile](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_profile) | resource |
| [tls_private_key.tutorial_ssh_key](https://registry.terraform.io/providers/hashicorp/tls/4.0.4/docs/resources/private_key) | resource |
| [spectrocloud_cloudaccount_aws.account](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/cloudaccount_aws) | data source |
| [spectrocloud_cloudaccount_azure.account](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/cloudaccount_azure) | data source |
| [spectrocloud_cloudaccount_gcp.account](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/cloudaccount_gcp) | data source |
| [spectrocloud_pack.aws_cni](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.aws_csi](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.aws_k8s](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.aws_ubuntu](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.azure_cni](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.azure_csi](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.azure_k8s](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.azure_ubuntu](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.gcp_cni](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.gcp_csi](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.gcp_k8s](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.gcp_ubuntu](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.proxy](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws-cloud-account-name"></a> [aws-cloud-account-name](#input\_aws-cloud-account-name) | The name of your AWS account as assigned in Palette | `string` | `""` | no |
| <a name="input_aws-key-pair-name"></a> [aws-key-pair-name](#input\_aws-key-pair-name) | The name of the AWS key pair to use for SSH access to the cluster. Refer to [EC2 Key Pairs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html) to learn more. | `string` | `""` | no |
| <a name="input_aws-region"></a> [aws-region](#input\_aws-region) | AWS region | `string` | n/a | yes |
| <a name="input_aws_master_nodes"></a> [aws\_master\_nodes](#input\_aws\_master\_nodes) | AWS master nodes configuration. | <pre>object({<br>    count              = string<br>    control_plane      = bool<br>    instance_type      = string<br>    disk_size_gb       = string<br>    availability_zones = list(string)<br>  })</pre> | <pre>{<br>  "availability_zones": [<br>    "us-east-1a"<br>  ],<br>  "control_plane": true,<br>  "count": "1",<br>  "disk_size_gb": "60",<br>  "instance_type": "m4.2xlarge"<br>}</pre> | no |
| <a name="input_aws_worker_nodes"></a> [aws\_worker\_nodes](#input\_aws\_worker\_nodes) | AWS worker nodes configuration. | <pre>object({<br>    count              = string<br>    control_plane      = bool<br>    instance_type      = string<br>    disk_size_gb       = string<br>    availability_zones = list(string)<br>  })</pre> | <pre>{<br>  "availability_zones": [<br>    "us-east-1a"<br>  ],<br>  "control_plane": false,<br>  "count": "1",<br>  "disk_size_gb": "60",<br>  "instance_type": "m4.2xlarge"<br>}</pre> | no |
| <a name="input_azure-cloud-account-name"></a> [azure-cloud-account-name](#input\_azure-cloud-account-name) | The name of your Azure account as assigned in Palette | `string` | `""` | no |
| <a name="input_azure-region"></a> [azure-region](#input\_azure-region) | Azure region | `string` | `"eastus"` | no |
| <a name="input_azure_master_nodes"></a> [azure\_master\_nodes](#input\_azure\_master\_nodes) | Azure master nodes configuration. | <pre>object({<br>    count               = string<br>    control_plane       = bool<br>    instance_type       = string<br>    disk_size_gb        = string<br>    azs                 = list(string)<br>    is_system_node_pool = bool<br>  })</pre> | <pre>{<br>  "azs": [<br>    "1"<br>  ],<br>  "control_plane": true,<br>  "count": "1",<br>  "disk_size_gb": "60",<br>  "instance_type": "Standard_A8_v2",<br>  "is_system_node_pool": false<br>}</pre> | no |
| <a name="input_azure_resource_group"></a> [azure\_resource\_group](#input\_azure\_resource\_group) | Azure resource group | `string` | `""` | no |
| <a name="input_azure_subscription_id"></a> [azure\_subscription\_id](#input\_azure\_subscription\_id) | Azure subscription ID | `string` | `""` | no |
| <a name="input_azure_worker_nodes"></a> [azure\_worker\_nodes](#input\_azure\_worker\_nodes) | Azure worker nodes configuration. | <pre>object({<br>    count               = string<br>    control_plane       = bool<br>    instance_type       = string<br>    disk_size_gb        = string<br>    azs                 = list(string)<br>    is_system_node_pool = bool<br>  })</pre> | <pre>{<br>  "azs": [],<br>  "control_plane": false,<br>  "count": "1",<br>  "disk_size_gb": "60",<br>  "instance_type": "Standard_A8_v2",<br>  "is_system_node_pool": false<br>}</pre> | no |
| <a name="input_deploy-aws"></a> [deploy-aws](#input\_deploy-aws) | A flag for enabling a deployment on AWS | `bool` | n/a | yes |
| <a name="input_deploy-azure"></a> [deploy-azure](#input\_deploy-azure) | A flag for enabling a deployment on Azure | `bool` | n/a | yes |
| <a name="input_deploy-gcp"></a> [deploy-gcp](#input\_deploy-gcp) | A flag for enabling a deployment on GCP | `bool` | n/a | yes |
| <a name="input_gcp-cloud-account-name"></a> [gcp-cloud-account-name](#input\_gcp-cloud-account-name) | The name of your GCP account as assigned in Palette | `string` | `""` | no |
| <a name="input_gcp-region"></a> [gcp-region](#input\_gcp-region) | GCP region | `string` | `"us-central1"` | no |
| <a name="input_gcp_master_nodes"></a> [gcp\_master\_nodes](#input\_gcp\_master\_nodes) | GCP master nodes configuration. | <pre>object({<br>    count              = string<br>    control_plane      = bool<br>    instance_type      = string<br>    disk_size_gb       = string<br>    availability_zones = list(string)<br>  })</pre> | <pre>{<br>  "availability_zones": [<br>    "us-central1-a"<br>  ],<br>  "control_plane": true,<br>  "count": "1",<br>  "disk_size_gb": "60",<br>  "instance_type": "n1-standard-4"<br>}</pre> | no |
| <a name="input_gcp_project_name"></a> [gcp\_project\_name](#input\_gcp\_project\_name) | The name of your GCP project | `string` | `""` | no |
| <a name="input_gcp_worker_nodes"></a> [gcp\_worker\_nodes](#input\_gcp\_worker\_nodes) | GCP worker nodes configuration. | <pre>object({<br>    count              = string<br>    control_plane      = bool<br>    instance_type      = string<br>    disk_size_gb       = string<br>    availability_zones = list(string)<br>  })</pre> | <pre>{<br>  "availability_zones": [<br>    "us-central1-a"<br>  ],<br>  "control_plane": false,<br>  "count": "1",<br>  "disk_size_gb": "60",<br>  "instance_type": "n1-standard-4"<br>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The default tags to apply to Palette resources | `list(string)` | <pre>[<br>  "spectro-cloud-education",<br>  "app:hello-universe",<br>  "repository:spectrocloud:tutorials",<br>  "terraform_managed:true",<br>  "tutorial:iaas-cluster-deployment-tf"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_Advisory"></a> [Advisory](#output\_Advisory) | n/a |
