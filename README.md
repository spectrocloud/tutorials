[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)

# Spectro Cloud Tutorials
A collection of Spectro Cloud tutorials and their respective sample code.

<p align="center">
  <img src="/static/img/spectro-wizard.png" alt="drawing" width="500"/>
</p>



The following tutorial code is available:
- [hello-universe-tf](./terraform/hello-universe-tf/README.md) - Deploy the Hello Universe application into two Palette Virtual Clusters. [Link](https://docs.spectrocloud.com/devx/apps/deploy-app) to the tutorial.



# Contribution

Review the [Contribution](./docs/CONTRIBUTION.md) docs before creating a PR.

## Prerequisites

- NodeJS v18 or greater.
- Terraform v1.3.0 or greater.
- [Terraform-docs](https://terraform-docs.io/) 


## Docker

All the tutorials are available in a Docker that you can use to get started with the tutorials easily. The Docker file includes the following tools.

> The Docker file is build for a Linux environment. You can use this on a Mac and Windows. Windows users will require the usage of WSL2.


| Tool          | Description                                                    |
|---------------|----------------------------------------------------------------|
| `terraform`   | Infrastructure as code tool                                    |
| `spectro cli` | Spectro Cloud command-line interface                           |
| `spectro registry server` | Spectro Cloud Registry Server                      |
| `ngrok`       | Secure tunnels to localhost                                    |
| `kubectl`     | Kubernetes command-line tool                                   |
| `bash`        | Unix shell                                                     |
| `curl`        | Command line tool and library for transferring data with URLs  |
| `git`         | Distributed version control system                             |
| `openssl`     | Toolkit for the Transport Layer Security (TLS) protocol        |
| `jq`          | Lightweight and flexible command-line JSON processor           |
| `bind-tools`  | Collection of DNS utilities, including dig, nslookup, and host |
| `wget`        | Free utility for non-interactive download of files from the Web|
| `ca-certificates` | Common set of CA certificates                              |


The Spectro Cloud registry server has the following credentials:

- `username`: `admin`

- `password`: `admin`


## Checklist

When creating a tutorial folder, ensure you review the following task list:

- [ ] Initialized the repository by issuing the command `make init` in the root context.

- [ ] Added a README.md file that explains the tutorial code and links to the respective tutorial page. 

- [ ] Verified all Terraform variables have helpful descriptions.

- [ ] Formatted all code with proper `fmt` command such as `go fmt`, or `terraform fmt`.

- [ ] If Terrraform, run the following command in the tutorial folder to generate Terrform documentation.

  ```shell
  terraform-docs markdown table . >> README.md`
  ```
- [ ] Use a semantic release message in the commit message, such as `"fix: your change here"`, to create a new release. 


- [ ] Ensure the required education tags are added to Terraform resources. 
  - `spectro-cloud-education`
  - `app:<name of app>`
  - `repository:spectrocloud/tutorials/`
  - `terraform_managed:true`

  Example: 
  ```terraform
  variable "tags" {
    type        = list(string)
    description = "The default tags to apply to Palette resources"
    default     = ["spectro-cloud-education", "app:hello-universe", "repository:spectrocloud/tutorials/", "terraform_managed:true"]
  }
  ```