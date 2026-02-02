# roboshop-learn-terraform


| Component                | What it means                           | Example                        |
| ------------------------ | --------------------------------------- | ------------------------------ |
| **Protocol**             | TCP, UDP, ICMP, or ALL                  | TCP                            |
| **Port / Port Range**    | Which port(s) the traffic is allowed on | 22 (SSH), 80 (HTTP), 8000-9000 |
| **Source / Destination** | Who can send or receive traffic         | CIDR (0.0.0.0/0), another SG   |
| **Direction**            | Ingress (inbound) or Egress (outbound)  | Ingress                        |


code style in terraform:
=========================
* terraform fmt -recursive: will change the code style in the code
here -recursive : if there are any subfolders like child modules in root module those also change the code styles

meta-arguments life cycle:
==========================
need to read

state file:
============
terraform state list

Makefile:
=========
terraform init
terraform apply -auto-approve
terraform state rm resource aws_ami.ami, removed from state file
terraform destroy -auto-approve


AMIs used via data sources are never managed or destroyed by Terraform; even AMIs created as resources will remain in AWS if removed from the state before running terraform destroy.

use_lockfile = true:
=====================
terraform { backend "s3" { bucket = "my-terraform-state" key = "prod/terraform.tfstate" region = "us-east-1" use_lockfile = true } } if backend has any changes then only initialiation will change otherwise skip and continue


Makefile:
=========
help:
@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

dev-apply:
    rm -f .terraform/terraform.tfstate
    terraform init -backend-config=env-dev/state.tfvars
    terraform apply -var-file=env-dev/main.tfvars -auto-approve

prod-apply:
rm -f .terraform/terraform.tfstate
terraform init -backend-config=env-prod/state.tfvars
terraform apply -var-file=env-prod/main.tfvars -auto-approve


dev-destroy:
rm -f .terraform/terraform.tfstate
terraform init -backend-config=env-prod/state.tfvars
terraform destroy -var-file=env-prod/main.tfvars -auto-approve


prod-destroy:
rm -f .terraform/terraform.tfstate
terraform init -backend-config=env-prod/state.tfvars
terraform destroy -var-file=env-prod/main.tfvars -auto-approve



