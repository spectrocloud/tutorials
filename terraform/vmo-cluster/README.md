# Deploy and Manage VMs using Palette VMO

This folder contains the demo code for the **Deploy and Manage VMs using Palette VMO** tutorial.

The Terraform code has two main toggle variables that you can use to deploy resources to [Canonical MAAS](https://maas.io/docs).

| Variable         | Provider | Description                                       | Default |
| ---------------- | -------- | ------------------------------------------------- | ------- |
| `deploy-maas`    | MAAS     | Enable to deploy a cluster to MAAS.               | `false` |
| `deploy-maas-vm` | MAAS     | Enable to deploy a VM to a deployed MAAS cluster. | `false` |


To get started, open the **terraform.tfvars** file. Toggle the provider variable as specified in the table and provide values to your cloud provider variables, replacing all instances of the string `REPLACE ME`.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.4.1 |
| <a name="requirement_spectrocloud"></a> [spectrocloud](#requirement\_spectrocloud) | >= 0.22.2 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.0.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | 2.4.1 |
| <a name="provider_spectrocloud"></a> [spectrocloud](#provider\_spectrocloud) | 0.22.2 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [spectrocloud_cluster_profile.maas-vmo-profile](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_profile) | resource |
| [spectrocloud_cluster_maas.maas-cluster](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/cluster_maas) | resource |
| [spectrocloud_virtual_machine.virtual-machine](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/resources/virtual_machine) | resource |
| [spectrocloud_cloudaccount_maas.account](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/cloudaccount_maas) | data source |
| [spectrocloud_pack.maas_vmo](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.maas_cni](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.maas_csi](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.maas_k8s](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_pack.maas_ubuntu](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/pack) | data source |
| [spectrocloud_cluster.maas_vmo_cluster](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/cluster) | data source |
| [spectrocloud_registry.public_registry](https://registry.terraform.io/providers/spectrocloud/spectrocloud/latest/docs/data-sources/registry) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deploy-maas"></a> [deploy-maas](#input\_deploy-maas) | A flag for enabling a cluster deployment on MAAS. | `bool` | n/a | yes |
| <a name="input_deploy-maas-vm"></a> [deploy-maas-vm](#input\_deploy-maas-vm) | A flag for enabling a VM creation on a MAAS cluster. | `bool` | n/a | yes |
| <a name="input_pcg-name"></a> [pcg-name](#input\_pcg-name) |  The name of the PCG that will be used to deploy the cluster. | `string` | n/a | yes |
| <a name="input_maas-domain"></a> [maas-domain](#input\_maas-domain) |  The MaaS domain that will be used to deploy the cluster. | `string` | n/a | yes |
| <a name="input_maas-worker-nodes"></a> [maas-worker-nodes](#input\_maas-worker-nodes) |  The number of worker nodes that will be used to deploy the cluster. | `number` | 1 | yes |
| <a name="input_maas-control-plane-nodes"></a> [maas-control-plane-nodes](#input\_maas-control-plane-nodes) |  The number of control plane nodes that will be used to deploy the cluster. | `number` | 1 | yes |
| <a name="input_maas-worker-resource-pool"></a> [maas-worker-resource-pool](#input\_maas-worker-resource-pool) |  The resource pool to deploy the worker nodes to. | `string` | n/a | yes |
| <a name="input_maas-control-plane-resource-pool"></a> [maas-control-plane-resource-pool](#input\_maas-control-plane-resource-pool) |  The resource pool to deploy the control plane nodes to. | `string` | n/a | yes |
| <a name="input_maas-worker-azs"></a> [maas-worker-azs](#input\_maas-worker-azs) |  The set of availability zones to deploy the worker nodes to. | `set(string)` | n/a | yes |
| <a name="input_maas-control-plane-azs"></a> [maas-control-plane-azs](#input\_maas-control-plane-azs) |  The set of availability zones to deploy the control plane nodes to. | `set(string)` | n/a | yes |
| <a name="input_maas-worker-node-tags"></a> [maas-worker-node-tags](#input\_maas-worker-node-tags) |  The set of tag values that you want to apply to all nodes in the node worker pool. | `set(string)` | n/a | yes |
| <a name="input_maas-control-plane-node-tags"></a> [maas-control-plane-node-tags](#input\_maas-control-plane-node-tags) |  The set of tag values that you want to apply to all nodes in the node control plane pool. | `set(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The default tags to apply to Palette resources. | `list(string)` | <pre>[<br>  "spectro-cloud-education",<br>  "spectrocloud:tutorials",<br>  "terraform_managed:true",<br>  "tutorial:vmo-cluster-deployment"<br>]</pre> | no |

## Outputs
No outputs.

<!-- END_TF_DOCS -->
