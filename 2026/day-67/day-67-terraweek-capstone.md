# Day 67 — TerraWeek Capstone: Multi-Environment Infrastructure with Terraform Workspaces

## Objective
Build a production-style multi-environment AWS infrastructure using one Terraform codebase with custom modules and Terraform workspaces.

---

## Project Structure

```bash
2026/
└── day-67/
    ├── day-67-terraweek-capstone.md
    └── terraweek-capstone/
        ├── main.tf
        ├── variables.tf
        ├── outputs.tf
        ├── providers.tf
        ├── locals.tf
        ├── dev.tfvars
        ├── staging.tfvars
        ├── prod.tfvars
        ├── .gitignore
        └── modules/
            ├── vpc/
            ├── security-group/
            └── ec2-instance/
```

---

## What is Terraform Workspace?

Terraform workspace provides environment isolation using the same codebase.

Examples:
- dev
- staging
- prod

Command:

```bash
terraform workspace show
```

Returns:

```bash
terraform.workspace
```

Inside config:
- dev
- staging
- prod

---

## Workspace State Location

Terraform stores separate state files:

```bash
terraform.tfstate.d/dev/terraform.tfstate
terraform.tfstate.d/staging/terraform.tfstate
terraform.tfstate.d/prod/terraform.tfstate
```

This ensures environment isolation.

---

## Why Workspaces Instead of Separate Directories?

Separate directories:
- duplicated code
- harder maintenance
- update repetition

Workspaces:
- one codebase
- isolated state
- easier scaling
- production-friendly

---

## Custom Modules Built

### 1. VPC Module
Resources:
- aws_vpc
- aws_subnet
- aws_internet_gateway
- aws_route_table
- aws_route_table_association

Outputs:
- vpc_id
- subnet_id

---

### 2. Security Group Module
Resources:
- aws_security_group
- dynamic ingress rules
- egress allow all

Output:
- sg_id

---

### 3. EC2 Module
Resources:
- aws_instance

Outputs:
- instance_id
- public_ip

---

## Workspace-Aware Configuration

locals.tf:

```hcl
locals {
  environment = terraform.workspace

  name_prefix = "${var.project_name}-${local.environment}"

  common_tags = {
    Project     = var.project_name
    Environment = local.environment
    ManagedBy   = "Terraform"
    Workspace   = terraform.workspace
  }
}
```

This makes infrastructure automatically adapt to active workspace.

---

## Environment Configuration

| Environment | VPC CIDR      | Subnet CIDR    | Instance Type | Ports |
|------------|---------------|----------------|--------------|-------|
| Dev        | 10.0.0.0/16   | 10.0.1.0/24    | t2.micro     | 22,80 |
| Staging    | 10.1.0.0/16   | 10.1.1.0/24    | t2.small     | 22,80,443 |
| Prod       | 10.2.0.0/16   | 10.2.1.0/24    | t3.small     | 80,443 |

---

## Deployment Commands

DEV:

```bash
terraform workspace select dev
terraform apply -var-file="dev.tfvars"
```

STAGING:

```bash
terraform workspace select staging
terraform apply -var-file="staging.tfvars"
```

PROD:

```bash
terraform workspace select prod
terraform apply -var-file="prod.tfvars"
```

---

## Verification

AWS Console should show:

### VPCs
- terraweek-dev-vpc
- terraweek-staging-vpc
- terraweek-prod-vpc

---

### EC2
- terraweek-dev-server
- terraweek-staging-server
- terraweek-prod-server

---

### Security Groups
Environment-specific ingress rules.

---

## Terraform Best Practices Learned

### File Structure
Separate:
- providers.tf
- variables.tf
- outputs.tf
- locals.tf
- main.tf

Cleaner and maintainable.

---

### State Management
- use remote backend
- enable locking
- enable versioning
- isolate environments

---

### Variables
- never hardcode values
- use tfvars
- validate inputs

---

### Modules
- one responsibility per module
- reusable design
- define inputs
- define outputs
- pin versions

---

### Workspaces
- environment isolation
- single codebase
- clean separation

---

### Security
- ignore tfstate
- ignore tfvars
- never commit secrets
- protect backend access

---

### Commands
Always run:

```bash
terraform fmt
terraform validate
terraform plan
```

before apply.

---

### Tagging
Tag everything:

- Project
- Environment
- ManagedBy

---

### Naming Convention

Pattern:

```bash
<project>-<environment>-<resource>
```

Example:

```bash
terraweek-prod-server
```

---

### Cleanup
Destroy non-production infra when not needed.

---

## TerraWeek Learning Summary

| Day | Concepts |
|-----|----------|
| 61 | IaC, HCL, init, plan, apply, destroy |
| 62 | Providers, resources, dependencies |
| 63 | Variables, outputs, data sources, locals |
| 64 | Remote backend, locking, import, drift |
| 65 | Custom modules, registry modules |
| 66 | EKS provisioning, managed infrastructure |
| 67 | Workspaces, multi-environment capstone |

---

## Reflection

This capstone tied together the full Terraform journey.

Started with:
single resources

Ended with:
production-style multi-environment infrastructure with reusable modules and isolated workspaces.

Huge jump in understanding infrastructure as code.