# Day 65 — Terraform Modules: Build Reusable Infrastructure

## Objective
Learn how to build reusable Terraform modules and use public registry modules for production-grade infrastructure.

---

## Root Module vs Child Module

### Root Module
The root module is the main Terraform project directory where Terraform commands are executed.

Example:
- terraform init
- terraform plan
- terraform apply

Files:
- main.tf
- variables.tf
- outputs.tf
- providers.tf

---

### Child Module
A child module is a reusable Terraform component called from the root module.

Examples:
- EC2 module
- Security Group module

Benefits:
- Reusability
- Cleaner code
- Better maintenance
- Less duplication
- Standardized infrastructure

---

## Project Directory Structure

```bash
2026/
└── day-65/
    ├── day-65-modules.md
    └── terraform-modules/
        ├── main.tf
        ├── variables.tf
        ├── outputs.tf
        ├── providers.tf
        └── modules/
            ├── ec2-instance/
            │   ├── main.tf
            │   ├── variables.tf
            │   └── outputs.tf
            └── security-group/
                ├── main.tf
                ├── variables.tf
                └── outputs.tf
```

---

## EC2 Module

### Inputs
- ami_id
- instance_type
- subnet_id
- security_group_ids
- instance_name
- tags

### Outputs
- instance_id
- public_ip
- private_ip

Reusable for multiple EC2 deployments.

Used for:
- Web Server
- API Server

---

## Security Group Module

### Inputs
- vpc_id
- sg_name
- ingress_ports
- tags

### Outputs
- sg_id

Uses dynamic blocks to generate ingress rules automatically.

Example:
If ingress_ports = [22,80,443]

Terraform creates:
- SSH access
- HTTP access
- HTTPS access

---

## Public Registry Module Used

Terraform Registry VPC Module:

terraform-aws-modules/vpc/aws

Version:
5.1.0

Purpose:
Instead of manually writing:
- aws_vpc
- aws_subnet
- aws_route_table
- aws_route_table_association
- internet gateway
- route entries

The registry module creates them automatically.

---

## Hand-Written VPC vs Registry Module

### Hand-Written VPC
Manual resources:
- aws_vpc
- aws_subnet
- aws_route_table
- aws_route
- aws_internet_gateway
- aws_route_table_association

Approx resources:
6–8

---

### Registry VPC Module
Automatically creates:
- VPC
- public subnets
- private subnets
- route tables
- route associations
- internet gateway
- networking dependencies

Approx resources:
10+

Cleaner and production-ready.

---

## Module Versioning

Exact:
```hcl
version = "5.1.0"
```

Flexible:
```hcl
version = "~> 5.0"
```

Range:
```hcl
version = ">= 5.0, < 6.0"
```

Upgrade:
```bash
terraform init -upgrade
```

---

## Terraform State Module Prefixes

Check:
```bash
terraform state list
```

Examples:
```bash
module.vpc.aws_vpc.this[0]
module.web_server.aws_instance.this
module.api_server.aws_instance.this
module.web_sg.aws_security_group.this
```

---

## Module Download Location

Terraform downloads registry modules into:

```bash
.terraform/modules/
```

Check:
```bash
ls -la .terraform/modules
```

---

## Best Practices

### 1. Always Pin Module Versions
Prevents unexpected breaking changes.

---

### 2. Keep Modules Focused
One module = one responsibility.

Examples:
- EC2 module
- Security Group module

Avoid giant mixed-purpose modules.

---

### 3. Use Variables Instead of Hardcoding
Makes modules reusable across environments.

Example:
Dev / Test / Prod

---

### 4. Always Define Outputs
Allows parent/root modules to consume values.

Examples:
- instance_id
- public_ip
- security_group_id

---

### 5. Add README Documentation
Every module should explain:
- inputs
- outputs
- usage examples

---

## AWS Verification

Verify in AWS Console:

EC2:
- terraweek-web
- terraweek-api

Security Group:
- terraweek-web-sg

VPC:
- terraweek-vpc

---

## Screenshot Placeholder

Add screenshot here showing:
Two EC2 instances running from same reusable module.

Example:

![EC2 Screenshot](./screenshots/day65-ec2.png)

---

## Learning Summary

Today I learned:
- Terraform modules
- root vs child modules
- local custom modules
- Terraform Registry modules
- module outputs
- dynamic blocks
- reusable infrastructure design