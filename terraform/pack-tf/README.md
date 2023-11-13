# Hello Universe TF

This folder contains the demo code for the [Create and Deploy a Custom Add-On Pack](https://docs.spectrocloud.com/registries-and-packs/create-pack) tutorial.
Use the code in this directory with the tutorial. 


To get started, review the [prerequisites](#prerequisites). Next, follow the steps in the tutorial to deploy the cluster and custom add-on pack.
 Use the [terraform.tfvars](./terraform.tfvars) file to provide the required variables. Once you populate the variables, you can deploy the cluster and custom add-on pack.

## Prerequisites
You will need the following things before getting started:
1. A Palette API key.
2. A cloud account added to your Palette project settings. 
3. An AWS Key pair or SSH key created in the region where you will deploy the cluster.

> [!NOTE]
> This Terraform code will deploy the resources specified in the template to **AWS**.


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_spectrocloud"></a> [spectrocloud](#requirement\_spectrocloud) | >= 0.16.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.25.0 |
| <a name="provider_spectrocloud"></a> [spectrocloud](#provider\_spectrocloud) | 0.16.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [spectrocloud_cluster_aws.cluster](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_aws) | resource |
| [spectrocloud_cluster_profile.profile](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_profile) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [spectrocloud_cloudaccount_aws.account](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/cloudaccount_aws) | data source |
| [spectrocloud_pack.cni](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.csi](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.hellouniverse](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.k8s](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.spectro-proxy](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.ubuntu](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_registry.hellouniverseregistry](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/registry) | data source |
| [spectrocloud_registry.public_registry](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/registry) | data source |
| [spectrocloud_registry_oci.hellouniverseregistry](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/registry_oci) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_az_names"></a> [aws\_az\_names](#input\_aws\_az\_names) | Provide a list of AWS Availability Zones. For example: ['us-east-1a', 'us-east-1b', 'us-east-1c'] | `list(string)` | `[]` | no |
| <a name="input_aws_region_name"></a> [aws\_region\_name](#input\_aws\_region\_name) | Specify the AWS region where you want to deploy the cluster. | `string` | n/a | yes |
| <a name="input_cluster_cloud_account_aws_name"></a> [cluster\_cloud\_account\_aws\_name](#input\_cluster\_cloud\_account\_aws\_name) | Specify the AWS account integrated with Palette. Use the same name as the one used in the Palette project settings. | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the cluster. | `string` | `"pack-tutorial-cluster"` | no |
| <a name="input_cluster_profile_description"></a> [cluster\_profile\_description](#input\_cluster\_profile\_description) | Provide a description of the cluster profile. | `string` | `"My cluster profile as part of the packs tutorial."` | no |
| <a name="input_cluster_profile_name"></a> [cluster\_profile\_name](#input\_cluster\_profile\_name) | The name of the cluster profile. | `string` | `"pack-tutorial-profile"` | no |
| <a name="input_custom_addon_pack"></a> [custom\_addon\_pack](#input\_custom\_addon\_pack) | Custom add-on pack name. | `string` | `"hellouniverse"` | no |
| <a name="input_custom_addon_pack_version"></a> [custom\_addon\_pack\_version](#input\_custom\_addon\_pack\_version) | Custom add-on pack version. | `string` | `"1.0.0"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Specify the AWS instance type. | `string` | `"m4.xlarge"` | no |
| <a name="input_private_pack_registry"></a> [private\_pack\_registry](#input\_private\_pack\_registry) | The name of the private pack registry server. | `string` | n/a | yes |
| <a name="input_ssh_key_name"></a> [ssh\_key\_name](#input\_ssh\_key\_name) | Specify the AWS Keypair available in the AWS region where you want to deploy the cluster. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The default tags to apply to Palette resources | `list(string)` | <pre>[<br>  "spectro-cloud-education",<br>  "app:hello-universe",<br>  "terraform_managed:true"<br>]</pre> | no |
| <a name="input_use_oci_registry"></a> [use\_oci\_registry](#input\_use\_oci\_registry) | Set the use of OCI registry to true or false. If you are not using an OCI registry, set this value to false. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_Advisory"></a> [Advisory](#output\_Advisory) | n/a |
| <a name="output_profile_id"></a> [profile\_id](#output\_profile\_id) | n/a |
