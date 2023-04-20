# Hello Universe TF

This folder contains the demo code for the [Create and Deploy a Custom Add-On Pack](https://docs.spectrocloud.com/registries-and-packs/create-pack) tutorial.
The code is intended to be used with the tutorial and as a result may not execute if invoked directly with `terraform apply`.

Note that the Terraform code in the **data.tf** and **profile.tf** uses the data resources, the core infrastructure layers, for deployment to AWS cloud service provider. To deploy your resource to Azure or Google Cloud, use the specific layer details outlined in the **Cloud Service Provider Configurations** section below.

## Cloud Service Provider Configurations

Here are the details of the core infrastructure layers to use in the `spectrocloud_cluster_profile.profile` resource definition for AWS, Azure, and Google Cloud.  

### AWS Config

|**Pack Type**|**Registry**|**Pack Name**|**Tag**| **Version** |
|---|---|---|---|
|OS|Public Repo|`ubuntu-aws`|`LTS__20.4.x`| `20.04`|
|Kubernetes|Public Repo|`kubernetes`|`1.24.x`| `1.24.10` |
|Network|Public Repo|`cni-calico`|`3.25.x`|`3.25.0`|
|Storage|Public Repo|`csi-aws-ebs`|`1.16.x`|`1.16.0`|


### Azure Config

|**Pack Type**|**Registry**|**Pack Name**|**Tag**| **Version** |
|---|---|---|---|
|OS|Public Repo|`ubuntu-azure`|`LTS__22.4.x`|`22.04`|
|Kubernetes|Public Repo|`kubernetes`|`1.24.x`| `1.24.10` |
|Network|Public Repo|`cni-calico-azure`|`3.25.x`|`3.25.0`|
|Storage|Public Repo|`csi-azure`|`1.25.x`|`1.25.0`|


### Google Cloud Config

|**Pack Type**|**Registry**|**Pack Name**|**Tag**| **Version** |
|---|---|---|---|
|OS|Public Repo|`ubuntu-gcp`|`LTS__22.4.x`|`22.04`|
|Kubernetes|Public Repo|`kubernetes`|`1.24.x`|`1.24.10` |
|Network|Public Repo|`cni-calico`|`3.25.x`|`3.25.0`|
|Storage|Public Repo|`csi-gcp` |`1.0.x`|`1.0`|


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_spectrocloud"></a> [spectrocloud](#requirement\_spectrocloud) | >= 0.11.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_spectrocloud"></a> [spectrocloud](#provider\_spectrocloud) | 0.12.0 |

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
| <a name="input_aws_region_name"></a> [aws\_region\_name](#input\_aws\_region\_name) | Choose the AWS region. | `string` | `"us-east-2"` | no |
| <a name="input_cluster_cloud_account_aws_name"></a> [cluster\_cloud\_account\_aws\_name](#input\_cluster\_cloud\_account\_aws\_name) | Choose the AWS account integrated with Spektro Palette. | `string` | `"spectro-cloud"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Give the cluster a name. | `string` | `"pack-tutorial-cluster"` | no |
| <a name="input_cluster_profile_description"></a> [cluster\_profile\_description](#input\_cluster\_profile\_description) | Provide a description. | `string` | `"My cluster profile as part of the packs tutorial."` | no |
| <a name="input_cluster_profile_name"></a> [cluster\_profile\_name](#input\_cluster\_profile\_name) | Give the cluster-profile a name. | `string` | `"pack-tutorial-profile"` | no |
| <a name="input_custom_addon_pack"></a> [custom\_addon\_pack](#input\_custom\_addon\_pack) | Custom add-on pack name. | `string` | `"hellouniverse"` | no |
| <a name="input_private_pack_registry"></a> [private\_pack\_registry](#input\_private\_pack\_registry) | Private pack registry server name. | `string` | `"private-pack-registry"` | no |
| <a name="input_ssh_key_name"></a> [ssh\_key\_name](#input\_ssh\_key\_name) | Choose the AWS region. | `string` | `"aws_key_sk_us_east_2"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The default tags to apply to Palette resources | `list(string)` | <pre>[<br>  "spectro-cloud-education",<br>  "app:hello-universe",<br>  "terraform_managed:true"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_Advisory"></a> [Advisory](#output\_Advisory) | n/a |
| <a name="output_profile_id"></a> [profile\_id](#output\_profile\_id) | n/a |


