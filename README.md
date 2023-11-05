# Terraform IAC for Azure

This repository contains the Terraform code to provision and manage infrastructure on Microsoft Azure.

## Getting Started

These instructions will help you get your infrastructure up and running using Terraform.

### Prerequisites

Before you begin, ensure you have the following prerequisites:

- [Terraform](https://www.terraform.io/downloads.html) installed
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed
- Azure subscription and access to create resources

### Configuration

1. Clone this repository

2. Configure your Azure credentials by setting the required environment variables [as explained here.](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build)

3. Create a `env.tfvars` file with the required variables to run this project:

   ```hcl
    location     = "eastus"
    project_name = "fourlanches"
    db_login     = "login"
    db_password  = "password"
   ```

### Deploy Infrastructure

1. Initialize the Terraform project:

   ```shell
   terraform init
   ```

2. Plan the infrastructure changes:

   ```shell
   terraform plan -var-file=env.tfvars  
   ```

3. Apply the changes to create the infrastructure:

   ```shell
   terraform apply -var-file=env.tfvars  
   ```

4. Confirm by typing "yes" when prompted.

### Destroy Infrastructure

If you want to destroy the infrastructure created by Terraform, run:

```shell
terraform destroy
```