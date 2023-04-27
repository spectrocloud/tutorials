# Hello Universe TF

This folder contains the demo code for the [Create and Deploy a Custom Add-On Pack](https://docs.spectrocloud.com/registries-and-packs/create-pack) tutorial.
Use the code in this directory with the tutorial. 

## Prerequisites
You will need the following things before getting started:
1. Spectro Cloud API key generated from the Palette.
2. A cloud account added to your Palette project settings. 
3. An SSH key created in the region where you will deploy the cluster.

Note that the Terraform code, when executed, will deploy the resources to the **AWS** cloud service provider. 
To deploy your resource to Azure or Google Cloud, use the specific layer details outlined in the **Cloud Service Provider Configurations** section below.


## Cloud Service Provider Configurations
The code uses the data resources, the core infrastructure layers, defined in the **data.tf** to deploy the `spectrocloud_cluster_profile.profile` resource to the AWS. Here are the pack details for each infrastructure layer. 

### AWS Config

| Name | Version |
|------|---------|
| <a name="requirement_spectrocloud"></a> [spectrocloud](#requirement\_spectrocloud) | >= 0.11.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_spectrocloud"></a> [spectrocloud](#provider\_spectrocloud) | >= 0.11.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [spectrocloud_cluster_aws.cluster](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_aws) | resource |
| [spectrocloud_cluster_profile.profile](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_profile) | resource |
| [spectrocloud_cloudaccount_aws.account](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/cloudaccount_aws) | data source |
| [spectrocloud_pack.cni](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.csi](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.hellouniverse](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.k8s](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.spectro-proxy](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.ubuntu](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_registry.hellouniverseregistry](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/registry) | data source |
| [spectrocloud_registry.public_registry](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/registry) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region_name"></a> [aws\_region\_name](#input\_aws\_region\_name) | Choose the AWS region. | `string` | n/a | yes |
| <a name="input_cluster_cloud_account_aws_name"></a> [cluster\_cloud\_account\_aws\_name](#input\_cluster\_cloud\_account\_aws\_name) | Choose the AWS account integrated with Spektro Palette. | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Give the cluster a name. | `string` | `"pack-tutorial-cluster"` | no |
| <a name="input_cluster_profile_description"></a> [cluster\_profile\_description](#input\_cluster\_profile\_description) | Provide a description. | `string` | `"My cluster profile as part of the packs tutorial."` | no |
| <a name="input_cluster_profile_name"></a> [cluster\_profile\_name](#input\_cluster\_profile\_name) | Give the cluster-profile a name. | `string` | `"pack-tutorial-profile"` | no |
| <a name="input_custom_addon_pack"></a> [custom\_addon\_pack](#input\_custom\_addon\_pack) | Custom add-on pack name. | `string` | `"hellouniverse"` | no |
| <a name="input_custom_addon_pack_version"></a> [custom\_addon\_pack\_version](#input\_custom\_addon\_pack\_version) | Custom add-on pack version. | `string` | `"1.0.0"` | no |
| <a name="input_private_pack_registry"></a> [private\_pack\_registry](#input\_private\_pack\_registry) | Private pack registry server name. | `string` | `"private-pack-registry"` | no |
| <a name="input_ssh_key_name"></a> [ssh\_key\_name](#input\_ssh\_key\_name) | Choose the AWS region. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The default tags to apply to Palette resources | `list(string)` | <pre>[<br>  "spectro-cloud-education",<br>  "app:hello-universe",<br>  "terraform_managed:true"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_Advisory"></a> [Advisory](#output\_Advisory) | n/a |
| <a name="output_profile_id"></a> [profile\_id](#output\_profile\_id) | n/a |
