# Single Database Module

This module will provision single database server.

## Usage

Import the module to your terraform template. 

```hcl
    module "DBServer" {
        source = "./database"
        
        image_id = "ami-xxxxx"  # Put your preferred AMI id in this variable
    }
```
Look ***variables.tfvars*** to see more varibles.

