# Cluster Profile Variables Tutorial

This folder contains the demo code for the **Cluster Profile Variables** tutorial.

The Terraform code has three main toggle variables that you can use to deploy to one of the following cloud providers.

| Variable        | Provider       | Description                                   | Default |
| --------------- | -------------- | --------------------------------------------- | ------- |
| `deploy-aws`    | AWS            | Enable to deploy a cluster to AWS.            | `false` |
| `deploy-azure`  | Azure          | Enable to deploy a cluster to Azure.          | `false` |
| `deploy-gcp`    | GCP            | Enable to deploy a cluster to GCP.            | `false` |


> You can enable as many providers as you want, just make sure to specify all required values for each provider.

To get started, open the **terraform.tfvars** file. Set the provider variable as specified in the table to `true` and provide values to your cloud provider variables, replacing all instances of the string `REPLACE ME`.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.4.1 |
| <a name="requirement_spectrocloud"></a> [spectrocloud](#requirement\_spectrocloud) | >= 0.23.6 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.0.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_spectrocloud"></a> [spectrocloud](#provider\_spectrocloud) | 0.23.6 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [spectrocloud_cluster_aws.aws-novar](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_aws) | resource |
| [spectrocloud_cluster_azure.azure-cluster](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_azure) | resource |
| [spectrocloud_cluster_gcp.gcp-cluster](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_gcp) | resource |
| [spectrocloud_cluster_profile.aws-profile-novar](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_profile) | resource |
| [spectrocloud_cluster_profile.aws-profile-var](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_profile) | resource |
| [spectrocloud_cluster_profile.azure-profile](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_profile) | resource |
| [spectrocloud_cluster_profile.gcp-profile](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_profile) | resource |
| [tls_private_key.tutorial_ssh_key_azure](https://registry.terraform.io/providers/hashicorp/tls/4.0.4/docs/resources/private_key) | resource |
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
| [spectrocloud_pack.hellouniverse](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_registry.community_registry](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/registry) | data source |
| [spectrocloud_registry.public_registry](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/registry) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_port"></a> [app\_port](#input\_app\_port) | The cluster port number on which the service will listen for incoming traffic. | `number` | n/a | yes |
| <a name="input_auth_token"></a> [auth\_token](#input\_auth\_token) | The base64 encoded auth token for the API connection. | `string` | n/a | yes |
| <a name="input_aws-cloud-account-name"></a> [aws-cloud-account-name](#input\_aws-cloud-account-name) | The name of your AWS account as assigned in Palette. | `string` | n/a | yes |
| <a name="input_aws-key-pair-name"></a> [aws-key-pair-name](#input\_aws-key-pair-name) | The name of the AWS key pair to use for SSH access to the cluster. | `string` | n/a | yes |
| <a name="input_aws-region"></a> [aws-region](#input\_aws-region) | AWS region | `string` | `"us-east-2"` | no |
| <a name="input_aws_control_plane_nodes"></a> [aws\_control\_plane\_nodes](#input\_aws\_control\_plane\_nodes) | AWS control plane nodes configuration. | <pre>object({<br/>    count              = string<br/>    control_plane      = bool<br/>    instance_type      = string<br/>    disk_size_gb       = string<br/>    availability_zones = list(string)<br/>  })</pre> | <pre>{<br/>  "availability_zones": [<br/>    "us-east-2a"<br/>  ],<br/>  "control_plane": true,<br/>  "count": "1",<br/>  "disk_size_gb": "60",<br/>  "instance_type": "m4.2xlarge"<br/>}</pre> | no |
| <a name="input_aws_worker_nodes"></a> [aws\_worker\_nodes](#input\_aws\_worker\_nodes) | AWS worker nodes configuration. | <pre>object({<br/>    count              = string<br/>    control_plane      = bool<br/>    instance_type      = string<br/>    disk_size_gb       = string<br/>    availability_zones = list(string)<br/>  })</pre> | <pre>{<br/>  "availability_zones": [<br/>    "us-east-2a"<br/>  ],<br/>  "control_plane": false,<br/>  "count": "1",<br/>  "disk_size_gb": "60",<br/>  "instance_type": "m4.2xlarge"<br/>}</pre> | no |
| <a name="input_azure-cloud-account-name"></a> [azure-cloud-account-name](#input\_azure-cloud-account-name) | The name of your Azure account as assigned in Palette. | `string` | `""` | no |
| <a name="input_azure-region"></a> [azure-region](#input\_azure-region) | Azure region. | `string` | `"eastus"` | no |
| <a name="input_azure-use-azs"></a> [azure-use-azs](#input\_azure-use-azs) | A flag for configuring whether to use Azure Availability Zones. Check if your Azure region supports availability zones by reviewing the [Azure Regions and Availability Zones](https://learn.microsoft.com/en-us/azure/reliability/availability-zones-service-support#azure-regions-with-availability-zone-support) resource. | `bool` | n/a | yes |
| <a name="input_azure_control_plane_nodes"></a> [azure\_control\_plane\_nodes](#input\_azure\_control\_plane\_nodes) | Azure control plane nodes configuration. | <pre>object({<br/>    count               = string<br/>    control_plane       = bool<br/>    instance_type       = string<br/>    disk_size_gb        = string<br/>    azs                 = list(string)<br/>    is_system_node_pool = bool<br/>  })</pre> | <pre>{<br/>  "azs": [<br/>    "1"<br/>  ],<br/>  "control_plane": true,<br/>  "count": "1",<br/>  "disk_size_gb": "60",<br/>  "instance_type": "Standard_A8_v2",<br/>  "is_system_node_pool": false<br/>}</pre> | no |
| <a name="input_azure_resource_group"></a> [azure\_resource\_group](#input\_azure\_resource\_group) | Azure resource group. | `string` | `""` | no |
| <a name="input_azure_subscription_id"></a> [azure\_subscription\_id](#input\_azure\_subscription\_id) | Azure subscription ID. | `string` | `""` | no |
| <a name="input_azure_worker_nodes"></a> [azure\_worker\_nodes](#input\_azure\_worker\_nodes) | Azure worker nodes configuration. | <pre>object({<br/>    count               = string<br/>    control_plane       = bool<br/>    instance_type       = string<br/>    disk_size_gb        = string<br/>    azs                 = list(string)<br/>    is_system_node_pool = bool<br/>  })</pre> | <pre>{<br/>  "azs": [<br/>    "1"<br/>  ],<br/>  "control_plane": false,<br/>  "count": "1",<br/>  "disk_size_gb": "60",<br/>  "instance_type": "Standard_A8_v2",<br/>  "is_system_node_pool": false<br/>}</pre> | no |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | The base64 encoded database password to connect to the API database. | `string` | n/a | yes |
| <a name="input_deploy-aws-novar"></a> [deploy-aws-novar](#input\_deploy-aws-novar) | A flag for enabling a deployment on AWS. | `bool` | n/a | yes |
| <a name="input_deploy-aws-var"></a> [deploy-aws-var](#input\_deploy-aws-var) | A flag for enabling a deployment on AWS using cluster profile variables. | `bool` | n/a | yes |
| <a name="input_deploy-azure"></a> [deploy-azure](#input\_deploy-azure) | A flag for enabling a deployment on Azure. | `bool` | n/a | yes |
| <a name="input_deploy-azure-var"></a> [deploy-azure-var](#input\_deploy-azure-var) | A flag for enabling a deployment on Azure using cluster profile variables. | `bool` | n/a | yes |
| <a name="input_deploy-gcp"></a> [deploy-gcp](#input\_deploy-gcp) | A flag for enabling a deployment on GCP. | `bool` | n/a | yes |
| <a name="input_deploy-gcp-var"></a> [deploy-gcp-var](#input\_deploy-gcp-var) | A flag for enabling a deployment on GCP using cluster profile variables. | `bool` | n/a | yes |
| <a name="input_gcp-cloud-account-name"></a> [gcp-cloud-account-name](#input\_gcp-cloud-account-name) | The name of your GCP account as assigned in Palette. | `string` | `""` | no |
| <a name="input_gcp-region"></a> [gcp-region](#input\_gcp-region) | GCP region | `string` | `"us-central1"` | no |
| <a name="input_gcp_control_plane_nodes"></a> [gcp\_control\_plane\_nodes](#input\_gcp\_control\_plane\_nodes) | GCP control plane nodes configuration. | <pre>object({<br/>    count              = string<br/>    control_plane      = bool<br/>    instance_type      = string<br/>    disk_size_gb       = string<br/>    availability_zones = list(string)<br/>  })</pre> | <pre>{<br/>  "availability_zones": [<br/>    "us-central1-a"<br/>  ],<br/>  "control_plane": true,<br/>  "count": "1",<br/>  "disk_size_gb": "60",<br/>  "instance_type": "n1-standard-4"<br/>}</pre> | no |
| <a name="input_gcp_project_name"></a> [gcp\_project\_name](#input\_gcp\_project\_name) | The name of your GCP project. | `string` | `""` | no |
| <a name="input_gcp_worker_nodes"></a> [gcp\_worker\_nodes](#input\_gcp\_worker\_nodes) | GCP worker nodes configuration. | <pre>object({<br/>    count              = string<br/>    control_plane      = bool<br/>    instance_type      = string<br/>    disk_size_gb       = string<br/>    availability_zones = list(string)<br/>  })</pre> | <pre>{<br/>  "availability_zones": [<br/>    "us-central1-a"<br/>  ],<br/>  "control_plane": false,<br/>  "count": "1",<br/>  "disk_size_gb": "60",<br/>  "instance_type": "n1-standard-4"<br/>}</pre> | no |
| <a name="input_palette-project"></a> [palette-project](#input\_palette-project) | The name of your project in Palette. | `string` | n/a | yes |
| <a name="input_profile_namespace"></a> [profile\_namespace](#input\_profile\_namespace) | The namespace in which the application will be deployed. | `string` | n/a | yes |
| <a name="input_replicas_number"></a> [replicas\_number](#input\_replicas\_number) | The number of pods to be created. | `number` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The default tags to apply to Palette resources. | `list(string)` | <pre>[<br/>  "spectro-cloud-education",<br/>  "app:hello-universe",<br/>  "spectrocloud:tutorials",<br/>  "terraform_managed:true",<br/>  "tutorial:getting-started-terraform"<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_Advisory"></a> [Advisory](#output\_Advisory) | n/a |
<!-- END_TF_DOCS -->
