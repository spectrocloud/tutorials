[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)

# Spectro Cloud Tutorials

A collection of Spectro Cloud tutorials and their respective sample code.

<p align="center">
  <img src="/static/img/spectro-wizard.png" alt="drawing" width="500"/>
</p>

The following tutorial code is available:

- [hello-universe-tf](./terraform/hello-universe-tf/README.md) - Deploy the Hello Universe application into two Palette Virtual Clusters. [Link](https://docs.spectrocloud.com/devx/apps/deploy-app) to the tutorial.

- [pack-tf](./terraform/pack-tf/README.md) - Learn how to create a custom pack. [Link](https://docs.spectrocloud.com/registries-and-packs/deploy-pack)

- [terraform-cluster-deployment-tf](./terraform/iaas-cluster-deployment-tf/README.md) - Learn how to deploy a cluster to a cloud provider with Palette. [Link](https://docs.spectrocloud.com/clusters/public-cloud/deploy-k8s-cluster)

- [terraform-cluster-update-tf](./terraform/iaas-cluster-update-tf/README.md) - Learn how to update a cluster deployed to a cloud provider with Palette. [Link](https://docs.spectrocloud.com/clusters/cluster-management/update-k8s-cluster)

- [Deploy an Edge cluster on VMware](./edge/vmware/README.md) - Learn how to deploy an Edge cluster on VMware. [Link](https://docs.spectrocloud.com/clusters/edge/site-deployment/deploy-cluster)

- [vmware-cluster-deployment-tf](./terraform/vmware-cluster-deployment-tf/README.md) - Learn how to deploy a VMware cluster and the Hello Universe application as a part of the Deploy App Workloads with a PCG tutorial. [Link](https://docs.spectrocloud.com/clusters/pcg/deploy-app-pcg)

- [getting-started-deployment-tf](./terraform/getting-started-deployment-tf/README.md) - Learn how to deploy and update a cluster to AWS, Azure, GCP, and VMware vSphere with Palette. [Link](https://docs.spectrocloud.com/getting-started/terraform)

- [cluster-profile-variables-tf](./terraform/cluster-profile-variables-tf/README.md) - Learn how to deploy a cluster using cluster profile variables to AWS, Azure, and GCP. [Link](https://docs.spectrocloud.com/getting-started/terraform)


## Docker

All the tutorials are available in a Docker image that you can use to get started with the tutorials.
Review the [Docker steps](./docs/docker.md) to get started with the Docker image.

## Image Verification

We sign our images through [Cosign](https://docs.sigstore.dev/signing/quickstart/). Review the [Image Verification](./docs/image-verification.md) page to learn more.

# Contribution

Review the [Contribution](./docs/CONTRIBUTION.md) docs before creating a PR.
