# Hello Universe TF

This folder contains the demo code for the [Deploy App Workloads with a PCG](https://docs.spectrocloud.com/clusters/pcg/deploy-app-pcg) tutorial. Use the code in this directory with the tutorial.

To get started, review the [prerequisites](#prerequisites). Next, follow the steps in the tutorial to deploy a VMware cluster and add-on pack.
Use the [terraform.tfvars](./terraform.tfvars) file to provide the required variables.

## Prerequisites

You will need the following items before getting started:

1. A Palette API key.
2. A VMware PCG added to your Palette account.
3. A public SSH key that will be used to access the cluster nodes. If not provided, a new key pair will be generated.

> [!NOTE]
> This Terraform code will deploy the resources specified in the template to **VMware vSphere**.

## Requirements

| Name                                                                              | Version   |
| --------------------------------------------------------------------------------- | --------- |
| <a name="requirement_local"></a> [local](#requirement_local)                      | 2.4.1     |
| <a name="requirement_spectrocloud"></a> [spectrocloud](#requirement_spectrocloud) | >= 0.16.1 |
| <a name="requirement_tls"></a> [tls](#requirement_tls)                            | 4.0.4     |
| <a name="requirement_vsphere"></a> [vsphere](#requirement_vsphere)                | >= 2.6.1  |

## Providers

| Name                                                                        | Version |
| --------------------------------------------------------------------------- | ------- |
| <a name="provider_local"></a> [local](#provider_local)                      | 2.4.1   |
| <a name="provider_spectrocloud"></a> [spectrocloud](#provider_spectrocloud) | 0.17.4  |
| <a name="provider_tls"></a> [tls](#provider_tls)                            | 4.0.4   |

## Modules

No modules.

## Resources

| Name                                                                                                                                                         | Type        |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------- |
| [local_file.public_key_file](https://registry.terraform.io/providers/hashicorp/local/2.4.1/docs/resources/file)                                              | resource    |
| [local_sensitive_file.private_key_file](https://registry.terraform.io/providers/hashicorp/local/2.4.1/docs/resources/sensitive_file)                         | resource    |
| [spectrocloud_cluster_profile.profile](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_profile)              | resource    |
| [spectrocloud_cluster_vsphere.cluster](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_vsphere)              | resource    |
| [tls_private_key.tutorial_ssh_key](https://registry.terraform.io/providers/hashicorp/tls/4.0.4/docs/resources/private_key)                                   | resource    |
| [spectrocloud_cloudaccount_vsphere.account](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/cloudaccount_vsphere) | data source |
| [spectrocloud_pack.cni](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack)                                     | data source |
| [spectrocloud_pack.csi](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack)                                     | data source |
| [spectrocloud_pack.hellouniverse](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack)                           | data source |
| [spectrocloud_pack.k8s](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack)                                     | data source |
| [spectrocloud_pack.metallb](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack)                                 | data source |
| [spectrocloud_pack.ubuntu](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack)                                  | data source |
| [spectrocloud_registry.community_registry](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/registry)              | data source |
| [spectrocloud_registry.public_registry](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/registry)                 | data source |

## Inputs

| Name                                                                                                               | Description                                                                                                                   | Type           | Default                                                                                                                                                                                          | Required |
| ------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :------: |
| <a name="input_cluster_name"></a> [cluster_name](#input_cluster_name)                                              | The name of the cluster.                                                                                                      | `string`       | `"pcg-tutorial-cluster"`                                                                                                                                                                         |    no    |
| <a name="input_cluster_profile_description"></a> [cluster_profile_description](#input_cluster_profile_description) | Provide a description of the cluster profile.                                                                                 | `string`       | `"My cluster profile as part of the PCG tutorial."`                                                                                                                                              |    no    |
| <a name="input_cluster_profile_name"></a> [cluster_profile_name](#input_cluster_profile_name)                      | The name of the cluster profile.                                                                                              | `string`       | `"pcg-tutorial-profile"`                                                                                                                                                                         |    no    |
| <a name="input_datacenter_name"></a> [datacenter_name](#input_datacenter_name)                                     | The name of the datacenter in vSphere..                                                                                       | `string`       | n/a                                                                                                                                                                                              |   yes    |
| <a name="input_datastore_name"></a> [datastore_name](#input_datastore_name)                                        | The name of the vSphere datastore.                                                                                            | `string`       | n/a                                                                                                                                                                                              |   yes    |
| <a name="input_folder_name"></a> [folder_name](#input_folder_name)                                                 | The name of the folder in vSphere.                                                                                            | `string`       | n/a                                                                                                                                                                                              |   yes    |
| <a name="input_metallb_ip"></a> [metallb_ip](#input_metallb_ip)                                                    | The IP address range for your MetalLB Load Balancer.                                                                          | `string`       | n/a                                                                                                                                                                                              |   yes    |
| <a name="input_network_name"></a> [network_name](#input_network_name)                                              | The name of the vSphere network.                                                                                              | `string`       | n/a                                                                                                                                                                                              |   yes    |
| <a name="input_pcg_name"></a> [pcg_name](#input_pcg_name)                                                          | The name of the PCG.                                                                                                          | `string`       | n/a                                                                                                                                                                                              |   yes    |
| <a name="input_resource_pool_name"></a> [resource_pool_name](#input_resource_pool_name)                            | The name of the vSphere resource pool.                                                                                        | `string`       | n/a                                                                                                                                                                                              |   yes    |
| <a name="input_search_domain"></a> [search_domain](#input_search_domain)                                           | The name of network search domain.                                                                                            | `string`       | n/a                                                                                                                                                                                              |   yes    |
| <a name="input_ssh_key"></a> [ssh_key](#input_ssh_key)                                                             | The path to the public key that will be added to the cluster nodes. If not provided, a new key pair will be generated.        | `string`       | n/a                                                                                                                                                                                              |   yes    |
| <a name="input_ssh_key_private"></a> [ssh_key_private](#input_ssh_key_private)                                     | The path to the private key that will be used to access the cluster nodes. If not provided, a new key pair will be generated. | `string`       | n/a                                                                                                                                                                                              |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                                                      | The default tags to apply to Palette resources                                                                                | `list(string)` | <pre>[<br> "spectro-cloud-education",<br> "app:hello-universe",<br> "terraform_managed:true",<br> "repository:spectrocloud:tutorials",<br> "tutorial:DEPLOY_APP_WORKLOADS_WITH_A_PCG"<br>]</pre> |    no    |
| <a name="input_vsphere_cluster"></a> [vsphere_cluster](#input_vsphere_cluster)                                     | The name of your vSphere cluster.                                                                                             | `string`       | n/a                                                                                                                                                                                              |   yes    |

## Outputs

| Name                                                                                                                 | Description                                                       |
| -------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| <a name="output_Advisory"></a> [Advisory](#output_Advisory)                                                          | n/a                                                               |
| <a name="output_ssh_connection_command"></a> [ssh_connection_command](#output_ssh_connection_command)                | Command to use the generated private SSH key to access the nodes. |
| <a name="output_ssh_connection_command_user"></a> [ssh_connection_command_user](#output_ssh_connection_command_user) | Command to use the user's private SSH key to access the nodes.    |
| <a name="output_ssh_key_location"></a> [ssh_key_location](#output_ssh_key_location)                                  | Location of the generated private SSH key file                    |
| <a name="output_ssh_public_key_location"></a> [ssh_public_key_location](#output_ssh_public_key_location)             | Location of the generated public SSH key file                     |
