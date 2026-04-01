#  Declarative & Cloud-Agnostic

- **Declarative** → Define *what you want*, Terraform handles *how to create it*  
- **Cloud-agnostic** → Works across multiple cloud providers  


# Setup & Installation

## Terraform Installation (Ubuntu)

     wget -O - https://apt.releases.hashicorp.com/gpg | \
     sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

     echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
     https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
     sudo tee /etc/apt/sources.list.d/hashicorp.list

    sudo apt update && sudo apt install terraform
## AWS CLI Setup

    aws configure

## Terraform Configuration


    main.tf
    terraform {
      required_providers {
        aws = {
          source  = "hashicorp/aws"
          version = "~> 5.0"
        }
      }
    }

    provider "aws" {
      region = "ap-south-1"
    }

    resource "aws_s3_bucket" "my_bucket" {
      bucket = "terraweek-ajay-2026"
    }

    resource "aws_instance" "my_ec2" {
      ami           = "ami-0f5ee92e2d63afc18"
      instance_type = "t2.micro"

      tags = {
        Name = "TerraWeek-Day1"
      }
    }

## Terraform Workflow

### Command	Description

`terraform init`	Initializes project & downloads providers
`terraform plan`	Shows execution plan
`terraform apply`	Creates infrastructure
`terraform destroy`	Deletes infrastructure
`terraform show`	Displays current state
`terraform state list`	Lists managed resources

### Terraform State File

- What it Contains
- Resource IDs
- Metadata
- Current infrastructure state

### Important Notes

- Never edit manually
- Never commit to Git
- Contains sensitive data

### Terraform Plan Symbols

Symbol	Meaning

`+`	Create
`~`	Modify
`-`	Destroy

### Terraform apply output

AWS S3 bucket

AWS EC2 instance

## Key Learnings

-Terraform is declarative and powerful

- Infrastructure can be fully automated

- State file is critical for tracking resources

- Easy to create and destroy infrastructure

## Conclusion

- This was my first step into Terraform and IaC.
Creating and destroying real AWS resources using code was a powerful experience and a key milestone in my DevOps journey.