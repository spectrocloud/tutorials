# Getting Started Cluster Deployment

This folder contains the demo code for the **Getting Started Cluster Management with Terraform** tutorials.

- [Cluster Management with Terraform - AWS](https://docs.spectrocloud.com/getting-started/aws/manage-cluster-tf)
- [Cluster Management with Terraform - Azure](https://docs.spectrocloud.com/getting-started/azure/manage-cluster-tf)
- [Cluster Management with Terraform - GCP](https://docs.spectrocloud.com/getting-started/gcp/manage-cluster-tf)
- [Cluster Management with Terraform - VMware](https://docs.spectrocloud.com/getting-started/vmware/manage-cluster-tf)

The Terraform code has four main toggle variables that you can use to deploy to one of the following cloud providers.

| Variable        | Provider       | Description                                   | Default |
| --------------- | -------------- | --------------------------------------------- | ------- |
| `deploy-aws`    | AWS            | Enable to deploy a cluster to AWS.            | `false` |
| `deploy-azure`  | GCP            | Enable to deploy a cluster to Azure.          | `false` |
| `deploy-gcp`    | Azure          | Enable to deploy a cluster to GCP.            | `false` |
| `deploy-vmware` | VMware vSphere | Enable to deploy a cluster to VMware vSphere. | `false` |

> You can enable as many providers as you want, just make sure to specify all required values for each provider.

To get started, open the **terraform.tfvars** file. Toggle the provider variable as specified in the table and provide values to your cloud provider variables, replacing all instances of the string `REPLACE ME`.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.4.1 |
| <a name="requirement_spectrocloud"></a> [spectrocloud](#requirement\_spectrocloud) | >= 0.19.0-pre |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.0.4 |
| <a name="requirement_vsphere"></a> [vsphere](#requirement\_vsphere) | >= 2.6.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | 2.4.1 |
| <a name="provider_spectrocloud"></a> [spectrocloud](#provider\_spectrocloud) | 0.20.6 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_file.public_key_file](https://registry.terraform.io/providers/hashicorp/local/2.4.1/docs/resources/file) | resource |
| [local_sensitive_file.private_key_file](https://registry.terraform.io/providers/hashicorp/local/2.4.1/docs/resources/sensitive_file) | resource |
| [spectrocloud_cluster_aws.aws-cluster](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_aws) | resource |
| [spectrocloud_cluster_azure.azure-cluster](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_azure) | resource |
| [spectrocloud_cluster_gcp.gcp-cluster](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_gcp) | resource |
| [spectrocloud_cluster_profile.aws-profile](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_profile) | resource |
| [spectrocloud_cluster_profile.aws-profile-kubecost](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_profile) | resource |
| [spectrocloud_cluster_profile.azure-profile](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_profile) | resource |
| [spectrocloud_cluster_profile.azure-profile-kubecost](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_profile) | resource |
| [spectrocloud_cluster_profile.gcp-profile](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_profile) | resource |
| [spectrocloud_cluster_profile.gcp-profile-kubecost](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_profile) | resource |
| [spectrocloud_cluster_profile.vmware-profile](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_profile) | resource |
| [spectrocloud_cluster_profile.vmware-profile-kubecost](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_profile) | resource |
| [spectrocloud_cluster_vsphere.vmware-cluster](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_vsphere) | resource |
| [spectrocloud_privatecloudgateway_ippool.ippool](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/privatecloudgateway_ippool) | resource |
| [tls_private_key.tutorial_ssh_key](https://registry.terraform.io/providers/hashicorp/tls/4.0.4/docs/resources/private_key) | resource |
| [tls_private_key.tutorial_ssh_key_azure](https://registry.terraform.io/providers/hashicorp/tls/4.0.4/docs/resources/private_key) | resource |
| [spectrocloud_cloudaccount_aws.account](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/cloudaccount_aws) | data source |
| [spectrocloud_cloudaccount_azure.account](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/cloudaccount_azure) | data source |
| [spectrocloud_cloudaccount_gcp.account](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/cloudaccount_gcp) | data source |
| [spectrocloud_cloudaccount_vsphere.account](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/cloudaccount_vsphere) | data source |
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
| [spectrocloud_pack.kubecost](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.vmware_cni](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.vmware_csi](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.vmware_k8s](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.vmware_metallb](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.vmware_ubuntu](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_private_cloud_gateway.pcg](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/private_cloud_gateway) | data source |
| [spectrocloud_registry.community_registry](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/registry) | data source |
| [spectrocloud_registry.public_registry](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/registry) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_namespace"></a> [app\_namespace](#input\_app\_namespace) | The namespace in which the application will be deployed. | `string` | n/a | yes |
| <a name="input_app_port"></a> [app\_port](#input\_app\_port) | The cluster port number on which the service will listen for incoming traffic. | `number` | n/a | yes |
| <a name="input_auth_token"></a> [auth\_token](#input\_auth\_token) | The base64 encoded auth token for the API connection. | `string` | n/a | yes |
| <a name="input_aws-cloud-account-name"></a> [aws-cloud-account-name](#input\_aws-cloud-account-name) | The name of your AWS account as assigned in Palette. | `string` | n/a | yes |
| <a name="input_aws-key-pair-name"></a> [aws-key-pair-name](#input\_aws-key-pair-name) | The name of the AWS key pair to use for SSH access to the cluster. | `string` | n/a | yes |
| <a name="input_aws-region"></a> [aws-region](#input\_aws-region) | AWS region | `string` | `"us-east-1"` | no |
| <a name="input_aws_control_plane_nodes"></a> [aws\_control\_plane\_nodes](#input\_aws\_control\_plane\_nodes) | AWS control plane nodes configuration. | <pre>object({<br>    count              = string<br>    control_plane      = bool<br>    instance_type      = string<br>    disk_size_gb       = string<br>    availability_zones = list(string)<br>  })</pre> | <pre>{<br>  "availability_zones": [<br>    "us-east-1a"<br>  ],<br>  "control_plane": true,<br>  "count": "1",<br>  "disk_size_gb": "60",<br>  "instance_type": "m4.2xlarge"<br>}</pre> | no |
| <a name="input_aws_worker_nodes"></a> [aws\_worker\_nodes](#input\_aws\_worker\_nodes) | AWS worker nodes configuration. | <pre>object({<br>    count              = string<br>    control_plane      = bool<br>    instance_type      = string<br>    disk_size_gb       = string<br>    availability_zones = list(string)<br>  })</pre> | <pre>{<br>  "availability_zones": [<br>    "us-east-1a"<br>  ],<br>  "control_plane": false,<br>  "count": "1",<br>  "disk_size_gb": "60",<br>  "instance_type": "m4.2xlarge"<br>}</pre> | no |
| <a name="input_azure-cloud-account-name"></a> [azure-cloud-account-name](#input\_azure-cloud-account-name) | The name of your Azure account as assigned in Palette. | `string` | `""` | no |
| <a name="input_azure-region"></a> [azure-region](#input\_azure-region) | Azure region. | `string` | `"eastus"` | no |
| <a name="input_azure-use-azs"></a> [azure-use-azs](#input\_azure-use-azs) | A flag for configuring whether to use Azure Availability Zones. Check if your Azure region supports availability zones by reviewing the [Azure Regions and Availability Zones](https://learn.microsoft.com/en-us/azure/reliability/availability-zones-service-support#azure-regions-with-availability-zone-support) resource. | `bool` | n/a | yes |
| <a name="input_azure_control_plane_nodes"></a> [azure\_control\_plane\_nodes](#input\_azure\_control\_plane\_nodes) | Azure control plane nodes configuration. | <pre>object({<br>    count               = string<br>    control_plane       = bool<br>    instance_type       = string<br>    disk_size_gb        = string<br>    azs                 = list(string)<br>    is_system_node_pool = bool<br>  })</pre> | <pre>{<br>  "azs": [<br>    "1"<br>  ],<br>  "control_plane": true,<br>  "count": "1",<br>  "disk_size_gb": "60",<br>  "instance_type": "Standard_A8_v2",<br>  "is_system_node_pool": false<br>}</pre> | no |
| <a name="input_azure_resource_group"></a> [azure\_resource\_group](#input\_azure\_resource\_group) | Azure resource group. | `string` | `""` | no |
| <a name="input_azure_subscription_id"></a> [azure\_subscription\_id](#input\_azure\_subscription\_id) | Azure subscription ID. | `string` | `""` | no |
| <a name="input_azure_worker_nodes"></a> [azure\_worker\_nodes](#input\_azure\_worker\_nodes) | Azure worker nodes configuration. | <pre>object({<br>    count               = string<br>    control_plane       = bool<br>    instance_type       = string<br>    disk_size_gb        = string<br>    azs                 = list(string)<br>    is_system_node_pool = bool<br>  })</pre> | <pre>{<br>  "azs": [<br>    "1"<br>  ],<br>  "control_plane": false,<br>  "count": "1",<br>  "disk_size_gb": "60",<br>  "instance_type": "Standard_A8_v2",<br>  "is_system_node_pool": false<br>}</pre> | no |
| <a name="input_datacenter_name"></a> [datacenter\_name](#input\_datacenter\_name) | The name of the datacenter in vSphere. | `string` | n/a | yes |
| <a name="input_datastore_name"></a> [datastore\_name](#input\_datastore\_name) | The name of the vSphere datastore. | `string` | n/a | yes |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | The base64 encoded database password to connect to the API database. | `string` | n/a | yes |
| <a name="input_deploy-aws"></a> [deploy-aws](#input\_deploy-aws) | A flag for enabling a deployment on AWS. | `bool` | n/a | yes |
| <a name="input_deploy-aws-kubecost"></a> [deploy-aws-kubecost](#input\_deploy-aws-kubecost) | A flag for enabling a deployment on AWS with Kubecost. | `bool` | n/a | yes |
| <a name="input_deploy-azure"></a> [deploy-azure](#input\_deploy-azure) | A flag for enabling a deployment on Azure. | `bool` | n/a | yes |
| <a name="input_deploy-azure-kubecost"></a> [deploy-azure-kubecost](#input\_deploy-azure-kubecost) | A flag for enabling a deployment on Azure with Kubecost. | `bool` | n/a | yes |
| <a name="input_deploy-gcp"></a> [deploy-gcp](#input\_deploy-gcp) | A flag for enabling a deployment on GCP. | `bool` | n/a | yes |
| <a name="input_deploy-gcp-kubecost"></a> [deploy-gcp-kubecost](#input\_deploy-gcp-kubecost) | A flag for enabling a deployment on GCP with Kubecost. | `bool` | n/a | yes |
| <a name="input_deploy-vmware"></a> [deploy-vmware](#input\_deploy-vmware) | A flag for enabling a deployment on VMware. | `bool` | n/a | yes |
| <a name="input_deploy-vmware-kubecost"></a> [deploy-vmware-kubecost](#input\_deploy-vmware-kubecost) | A flag for enabling a deployment on VMware with Kubecost. | `bool` | n/a | yes |
| <a name="input_deploy-vmware-static"></a> [deploy-vmware-static](#input\_deploy-vmware-static) | A flag for enabling a deployment on VMware using static IP placement. | `bool` | n/a | yes |
| <a name="input_folder_name"></a> [folder\_name](#input\_folder\_name) | The name of the folder in vSphere. | `string` | n/a | yes |
| <a name="input_gcp-cloud-account-name"></a> [gcp-cloud-account-name](#input\_gcp-cloud-account-name) | The name of your GCP account as assigned in Palette. | `string` | `""` | no |
| <a name="input_gcp-region"></a> [gcp-region](#input\_gcp-region) | GCP region | `string` | `"us-central1"` | no |
| <a name="input_gcp_control_plane_nodes"></a> [gcp\_control\_plane\_nodes](#input\_gcp\_control\_plane\_nodes) | GCP control plane nodes configuration. | <pre>object({<br>    count              = string<br>    control_plane      = bool<br>    instance_type      = string<br>    disk_size_gb       = string<br>    availability_zones = list(string)<br>  })</pre> | <pre>{<br>  "availability_zones": [<br>    "us-central1-a"<br>  ],<br>  "control_plane": true,<br>  "count": "1",<br>  "disk_size_gb": "60",<br>  "instance_type": "n1-standard-4"<br>}</pre> | no |
| <a name="input_gcp_project_name"></a> [gcp\_project\_name](#input\_gcp\_project\_name) | The name of your GCP project. | `string` | `""` | no |
| <a name="input_gcp_worker_nodes"></a> [gcp\_worker\_nodes](#input\_gcp\_worker\_nodes) | GCP worker nodes configuration. | <pre>object({<br>    count              = string<br>    control_plane      = bool<br>    instance_type      = string<br>    disk_size_gb       = string<br>    availability_zones = list(string)<br>  })</pre> | <pre>{<br>  "availability_zones": [<br>    "us-central1-a"<br>  ],<br>  "control_plane": false,<br>  "count": "1",<br>  "disk_size_gb": "60",<br>  "instance_type": "n1-standard-4"<br>}</pre> | no |
| <a name="input_ip_range_end"></a> [ip\_range\_end](#input\_ip\_range\_end) | The last IP address of your PCG IP pool range. | `string` | n/a | yes |
| <a name="input_ip_range_start"></a> [ip\_range\_start](#input\_ip\_range\_start) | The first IP address of your PCG IP pool range. | `string` | n/a | yes |
| <a name="input_metallb_ip"></a> [metallb\_ip](#input\_metallb\_ip) | The IP address range for your MetalLB load balancer. | `string` | n/a | yes |
| <a name="input_nameserver_addr"></a> [nameserver\_addr](#input\_nameserver\_addr) | A comma-separated list of DNS nameserver IP addresses of your network. | `set(string)` | n/a | yes |
| <a name="input_network_gateway"></a> [network\_gateway](#input\_network\_gateway) | The IP address of the vSphere network gateway. | `string` | n/a | yes |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | The name of the vSphere network. | `string` | n/a | yes |
| <a name="input_network_prefix"></a> [network\_prefix](#input\_network\_prefix) | The prefix of your vSphere network. Valid values are network CIDR subnet masks from the range 0-32. Example: 18. | `number` | n/a | yes |
| <a name="input_palette-project"></a> [palette-project](#input\_palette-project) | The name of your project in Palette. | `string` | n/a | yes |
| <a name="input_pcg_name"></a> [pcg\_name](#input\_pcg\_name) | The name of the PCG that will be used to deploy the cluster. | `string` | n/a | yes |
| <a name="input_replicas_number"></a> [replicas\_number](#input\_replicas\_number) | The number of pods to be created. | `number` | n/a | yes |
| <a name="input_resource_pool_name"></a> [resource\_pool\_name](#input\_resource\_pool\_name) | The name of the vSphere resource pool. | `string` | n/a | yes |
| <a name="input_search_domain"></a> [search\_domain](#input\_search\_domain) | The name of network search domain. | `string` | n/a | yes |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | The path to the public key that will be added to the cluster nodes. If not provided, a new key pair will be generated. | `string` | n/a | yes |
| <a name="input_ssh_key_private"></a> [ssh\_key\_private](#input\_ssh\_key\_private) | The path to the private key that will be used to access the cluster nodes. If not provided, a new key pair will be generated. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The default tags to apply to Palette resources. | `list(string)` | <pre>[<br>  "spectro-cloud-education",<br>  "app:hello-universe",<br>  "repository:spectrocloud:tutorials",<br>  "terraform_managed:true",<br>  "tutorial:getting-started-terraform"<br>]</pre> | no |
| <a name="input_vsphere_cluster"></a> [vsphere\_cluster](#input\_vsphere\_cluster) | The name of your vSphere cluster. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_Advisory"></a> [Advisory](#output\_Advisory) | n/a |
| <a name="output_ssh_connection_command"></a> [ssh\_connection\_command](#output\_ssh\_connection\_command) | Command to use the generated private SSH key to access the nodes. |
| <a name="output_ssh_connection_command_user"></a> [ssh\_connection\_command\_user](#output\_ssh\_connection\_command\_user) | Command to use the user's private SSH key to access the nodes. |
| <a name="output_ssh_key_location"></a> [ssh\_key\_location](#output\_ssh\_key\_location) | Location of the generated private SSH key file. |
| <a name="output_ssh_public_key_location"></a> [ssh\_public\_key\_location](#output\_ssh\_public\_key\_location) | Location of the generated public SSH key file. |
<!-- END_TF_DOCS -->
