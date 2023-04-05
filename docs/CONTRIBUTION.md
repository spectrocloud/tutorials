# Contribution

Welcome to the Spectro Cloud tutorials repository. If you want to contribute we ask that you review the following items before opening a pull request (PR).


- Open up an issue and discuss the topic with the team.

- Simple typos can be addressed with a PR and do not require an issue.



## Prerequisites

- NodeJS v18 or greater.
- Terraform v1.3.0 or greater.
- [Terraform-docs](https://terraform-docs.io/) 



# Get Started

1. Use the Makefile to help you initialize the project. Issue the command `make init`.

2. Review the [Checklist](#checklist) before submitting a PR.




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