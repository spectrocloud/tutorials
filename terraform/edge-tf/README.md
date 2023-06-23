# Deploy an Edge Cluster on VMware

This folder contains the demo code for the [Deploy an Edge Cluster on VMware](https://docs.spectrocloud.com/clusters/edge/deploy-cluster) tutorial. Use the code in this directory with the tutorial. The following code block shows the list of files. 

```bash
.
├── README.md
├── cluster.tf
├── data.tf
├── inputs.tf
├── manifests
│   ├── custom-content.yaml
│   └── hello-universe.yaml
├── profile.tf
├── provider.tf
└── terraform.tfvars
```



## Prerequisites
You will need the following items before getting started:
1. Spectro Cloud API key generated from Palette.
2. Palette project name where you will deploy your resources.
3. Virtual IP address for your Edge cluster. 
4. Three Edge host IDs, similar to `edge-ae4c3842a651f6e671cca5901b831edf`, one for the master pool node and two for worker pool nodes. 


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.9 |
| <a name="requirement_spectrocloud"></a> [spectrocloud](#requirement\_spectrocloud) | = 0.14.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_spectrocloud"></a> [spectrocloud](#provider\_spectrocloud) | = 0.14.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [spectrocloud_cluster_edge_native.cluster](https://registry.terraform.io/providers/spectrocloud/spectrocloud/0.14.0/docs/resources/cluster_edge_native) | resource |
| [spectrocloud_cluster_profile.profile](https://registry.terraform.io/providers/spectrocloud/spectrocloud/0.14.0/docs/resources/cluster_profile) | resource |
| [spectrocloud_pack.cni-calico](https://registry.terraform.io/providers/spectrocloud/spectrocloud/0.14.0/docs/data-sources/pack) | data source |
| [spectrocloud_pack.edge-k3s](https://registry.terraform.io/providers/spectrocloud/spectrocloud/0.14.0/docs/data-sources/pack) | data source |
| [spectrocloud_pack.edge-native-byoi](https://registry.terraform.io/providers/spectrocloud/spectrocloud/0.14.0/docs/data-sources/pack) | data source |
| [spectrocloud_registry.public_registry](https://registry.terraform.io/providers/spectrocloud/spectrocloud/0.14.0/docs/data-sources/registry) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Give the cluster a name. | `string` | `"edge-tutorial-cluster"` | no |
| <a name="input_cluster_profile_description"></a> [cluster\_profile\_description](#input\_cluster\_profile\_description) | Provide a description. | `string` | `"Cluster profile as part of the edge tutorial."` | no |
| <a name="input_cluster_profile_name"></a> [cluster\_profile\_name](#input\_cluster\_profile\_name) | Give the cluster-profile a name. | `string` | `"edge-tutorial-profile"` | no |
| <a name="input_sc_api_key"></a> [sc\_api\_key](#input\_sc\_api\_key) | Provide the Palette API key. | `string` | n/a | yes |
| <a name="input_sc_host_one"></a> [sc\_host\_one](#input\_sc\_host\_one) | Provide the Edge host ID to add to the master pool. | `string` | n/a | yes |
| <a name="input_sc_host_three"></a> [sc\_host\_three](#input\_sc\_host\_three) | Provide the Edge host ID to add to the worker pool. | `string` | n/a | yes |
| <a name="input_sc_host_two"></a> [sc\_host\_two](#input\_sc\_host\_two) | Provide the Edge host ID to add to the worker pool. | `string` | n/a | yes |
| <a name="input_sc_project_name"></a> [sc\_project\_name](#input\_sc\_project\_name) | Provide the Palette project name. | `string` | n/a | yes |
| <a name="input_sc_vip"></a> [sc\_vip](#input\_sc\_vip) | Provide the Virtual IP (VIP) address . | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The default tags to apply to Palette resources | `list(string)` | <pre>[<br>  "spectro-cloud-education",<br>  "app:hello-universe",<br>  "terraform_managed:true"<br>]</pre> | no |

## Outputs
No outputs.

## Usage
1. Clone the repository, and change into the current directory.

    ```bash
    git clone https://github.com/spectrocloud/tutorials.git
    cd tutorials/terraform/edge-tf
    ```

2. Update the following variable values in the **terraform.tfvars** file. 
    ```bash
    sc_api_key      = "REPLACE_ME"            # Example: "Weoh2xxxxxxxXXXXXXXxxxxx"
    sc_project_name = "REPLACE_ME"            # Example: "Default"
    sc_vip          = "REPLACE_ME"            # Example: "10.10.146.146"
    sc_host_one     = "REPLACE_ME"            # Example: edge-ae4c3842a651f6e671cca5901b831edf
    sc_host_two     = "REPLACE_ME"
    sc_host_three   = "REPLACE_ME"
    ```

3. Execute terraform commands to deploy Palette resources. 
    ```bash
    terraform init
    terraform plan
    terraform apply -auto-approve
    ```

4. To delete all resources, you can issue the following command.
    ```bash
    terraform destroy -auto-approve
    ```