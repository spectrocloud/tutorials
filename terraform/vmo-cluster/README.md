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
| <a name="requirement_spectrocloud"></a> [spectrocloud](#requirement\_spectrocloud) | 0.23.6 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.0.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_spectrocloud"></a> [spectrocloud](#provider\_spectrocloud) | 0.23.6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [spectrocloud_cluster_maas.maas-cluster](https://registry.terraform.io/providers/spectrocloud/spectrocloud/0.23.6/docs/resources/cluster_maas) | resource |
| [spectrocloud_cluster_profile.maas-vmo-profile](https://registry.terraform.io/providers/spectrocloud/spectrocloud/0.23.6/docs/resources/cluster_profile) | resource |
| [spectrocloud_virtual_machine.virtual-machine](https://registry.terraform.io/providers/spectrocloud/spectrocloud/0.23.6/docs/resources/virtual_machine) | resource |
| [spectrocloud_cloudaccount_maas.account](https://registry.terraform.io/providers/spectrocloud/spectrocloud/0.23.6/docs/data-sources/cloudaccount_maas) | data source |
| [spectrocloud_cluster.maas_vmo_cluster](https://registry.terraform.io/providers/spectrocloud/spectrocloud/0.23.6/docs/data-sources/cluster) | data source |
| [spectrocloud_pack.maas_cni](https://registry.terraform.io/providers/spectrocloud/spectrocloud/0.23.6/docs/data-sources/pack) | data source |
| [spectrocloud_pack.maas_csi](https://registry.terraform.io/providers/spectrocloud/spectrocloud/0.23.6/docs/data-sources/pack) | data source |
| [spectrocloud_pack.maas_k8s](https://registry.terraform.io/providers/spectrocloud/spectrocloud/0.23.6/docs/data-sources/pack) | data source |
| [spectrocloud_pack.maas_metallb](https://registry.terraform.io/providers/spectrocloud/spectrocloud/0.23.6/docs/data-sources/pack) | data source |
| [spectrocloud_pack.maas_ubuntu](https://registry.terraform.io/providers/spectrocloud/spectrocloud/0.23.6/docs/data-sources/pack) | data source |
| [spectrocloud_pack.maas_vmo](https://registry.terraform.io/providers/spectrocloud/spectrocloud/0.23.6/docs/data-sources/pack) | data source |
| [spectrocloud_registry.public_registry](https://registry.terraform.io/providers/spectrocloud/spectrocloud/0.23.6/docs/data-sources/registry) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster-profile-type"></a> [cluster-profile-type](#input\_cluster-profile-type) | The name of the PCG that will be used to deploy the cluster. | `string` | n/a | yes |
| <a name="input_cluster-profile-version"></a> [cluster-profile-version](#input\_cluster-profile-version) | The name of the PCG that will be used to deploy the cluster. | `string` | n/a | yes |
| <a name="input_cluster-services-CIDR"></a> [cluster-services-CIDR](#input\_cluster-services-CIDR) | CIDR notation subnets for cluster services ex. 192.168.1.0/24. | `set(string)` | n/a | yes |
| <a name="input_ctl-node-min-cpu"></a> [ctl-node-min-cpu](#input\_ctl-node-min-cpu) | Minimum number of CPU cores allocated to the Control Plane node. | `number` | n/a | yes |
| <a name="input_ctl-node-min-memory-mb"></a> [ctl-node-min-memory-mb](#input\_ctl-node-min-memory-mb) | Minimum amount of RAM allocated to the Control Plane node. | `number` | n/a | yes |
| <a name="input_deploy-maas"></a> [deploy-maas](#input\_deploy-maas) | A flag for enabling a deployment on MAAS. | `bool` | n/a | yes |
| <a name="input_deploy-maas-vm"></a> [deploy-maas-vm](#input\_deploy-maas-vm) | A flag for enabling a VM creation on the MAAS cluster. | `bool` | n/a | yes |
| <a name="input_host-vlans"></a> [host-vlans](#input\_host-vlans) | Node Allowed VLANs | `number` | `1` | no |
| <a name="input_maas-control-plane-azs"></a> [maas-control-plane-azs](#input\_maas-control-plane-azs) | Set of AZs for the MAAS control plane nodes. | `set(string)` | n/a | yes |
| <a name="input_maas-control-plane-node-tags"></a> [maas-control-plane-node-tags](#input\_maas-control-plane-node-tags) | Set of node tags for the MAAS control plane nodes. | `set(string)` | n/a | yes |
| <a name="input_maas-control-plane-nodes"></a> [maas-control-plane-nodes](#input\_maas-control-plane-nodes) | Number of MaaS control plane nodes | `number` | `1` | no |
| <a name="input_maas-control-plane-resource-pool"></a> [maas-control-plane-resource-pool](#input\_maas-control-plane-resource-pool) | Resource pool for the MAAS control plane nodes. | `string` | n/a | yes |
| <a name="input_maas-domain"></a> [maas-domain](#input\_maas-domain) | MAAS domain | `string` | n/a | yes |
| <a name="input_maas-worker-azs"></a> [maas-worker-azs](#input\_maas-worker-azs) | Set of AZs for the MAAS worker nodes. | `set(string)` | n/a | yes |
| <a name="input_maas-worker-node-tags"></a> [maas-worker-node-tags](#input\_maas-worker-node-tags) | Set of node tags for the MAAS worker nodes. | `set(string)` | n/a | yes |
| <a name="input_maas-worker-nodes"></a> [maas-worker-nodes](#input\_maas-worker-nodes) | Number of MaaS worker nodes | `number` | `1` | no |
| <a name="input_maas-worker-resource-pool"></a> [maas-worker-resource-pool](#input\_maas-worker-resource-pool) | Resource pool for the MAAS worker nodes. | `string` | n/a | yes |
| <a name="input_metallb-ip-pool"></a> [metallb-ip-pool](#input\_metallb-ip-pool) | CIDR notation subnets or IP range ex. 192.168.1.0/24 or 192.168.1.0-192.168.1.255 | `set(string)` | n/a | yes |
| <a name="input_node-network"></a> [node-network](#input\_node-network) | The subnet the Ubuntu nodes will use. | `string` | n/a | yes |
| <a name="input_palette-project"></a> [palette-project](#input\_palette-project) | The name of your project in Palette. | `string` | n/a | yes |
| <a name="input_palette-user-id"></a> [palette-user-id](#input\_palette-user-id) | The amount of storage to provision for your VM in Gi. | `string` | n/a | yes |
| <a name="input_pcg-name"></a> [pcg-name](#input\_pcg-name) | The name of the PCG that will be used to deploy the cluster. | `string` | n/a | yes |
| <a name="input_pod-CIDR"></a> [pod-CIDR](#input\_pod-CIDR) | CIDR notation subnets for the pd network ex. 192.168.1.0/24. | `set(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The default tags to apply to Palette resources. | `list(string)` | <pre>[<br/>  "spectro-cloud-education",<br/>  "spectrocloud:tutorials",<br/>  "terraform_managed:true",<br/>  "tutorial:vmo-cluster-deployment"<br/>]</pre> | no |
| <a name="input_vm-cpu-cores"></a> [vm-cpu-cores](#input\_vm-cpu-cores) | Number of CPU cores to allocate to your VM. | `number` | `1` | no |
| <a name="input_vm-cpu-sockets"></a> [vm-cpu-sockets](#input\_vm-cpu-sockets) | Number of CPU cores to allocate to your VM. | `number` | `1` | no |
| <a name="input_vm-cpu-threads"></a> [vm-cpu-threads](#input\_vm-cpu-threads) | Number of CPU cores to allocate to your VM. | `number` | `1` | no |
| <a name="input_vm-deploy-name"></a> [vm-deploy-name](#input\_vm-deploy-name) | The namespace where your VMs will be deployed. | `string` | n/a | yes |
| <a name="input_vm-deploy-namespace"></a> [vm-deploy-namespace](#input\_vm-deploy-namespace) | The namespace where your VMs will be deployed. | `string` | n/a | yes |
| <a name="input_vm-labels"></a> [vm-labels](#input\_vm-labels) | The namespace where your VMs will be deployed. | `set(string)` | n/a | yes |
| <a name="input_vm-memory-Gi"></a> [vm-memory-Gi](#input\_vm-memory-Gi) | The amount of storage to provision for your VM in Gi. | `string` | n/a | yes |
| <a name="input_vm-storage-Gi"></a> [vm-storage-Gi](#input\_vm-storage-Gi) | The amount of storage to provision for your VM in Gi. | `string` | n/a | yes |
| <a name="input_vm-vlans"></a> [vm-vlans](#input\_vm-vlans) | VM allowed VLANs. | `number` | `1` | no |
| <a name="input_vmo-cluster-name"></a> [vmo-cluster-name](#input\_vmo-cluster-name) | The name of the cluster. | `string` | n/a | yes |
| <a name="input_vmo-network-interface"></a> [vmo-network-interface](#input\_vmo-network-interface) | The network interface VMO will use for VM traffic. | `set(string)` | n/a | yes |
| <a name="input_wrk-node-min-cpu"></a> [wrk-node-min-cpu](#input\_wrk-node-min-cpu) | Minimum number of CPU cores allocated to the Control Plane node. | `number` | n/a | yes |
| <a name="input_wrk-node-min-memory-mb"></a> [wrk-node-min-memory-mb](#input\_wrk-node-min-memory-mb) | Minimum amount of RAM allocated to the Control Plane node. | `number` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->