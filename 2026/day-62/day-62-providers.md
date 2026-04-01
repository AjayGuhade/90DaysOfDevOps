# 🚀 Day 62 – Providers, Resources & Dependencies in Terraform

## 📌 Overview

On Day 62, I built a complete AWS networking infrastructure using Terraform.
This included creating a VPC, subnet, internet gateway, route table, security group, and an EC2 instance — all connected through Terraform’s dependency management.

---

## ⚙️ Provider Configuration

```hcl
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
```

---

## 🌐 Infrastructure Setup

### VPC

```hcl
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "TerraWeek-VPC"
  }
}
```

### Public Subnet

```hcl
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "TerraWeek-Public-Subnet"
  }
}
```

### Internet Gateway

```hcl
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}
```

### Route Table & Association

```hcl
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.rt.id
}
```

---

## 🔐 Security Group

```hcl
resource "aws_security_group" "sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "TerraWeek-SG"
  }
}
```

---

## 🖥 EC2 Instance

```hcl
resource "aws_instance" "main" {
  ami                         = "ami-0f5ee92e2d63afc18"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "TerraWeek-Server"
  }

  lifecycle {
    create_before_destroy = true
  }
}
```

---

## 🪣 Explicit Dependency Example

```hcl
resource "aws_s3_bucket" "logs" {
  bucket = "terraweek-ajay-logs-2026"

  depends_on = [aws_instance.main]
}
```

---

## 🔗 Dependencies in Terraform

### Implicit Dependencies

Terraform automatically determines resource order when references are used:

```hcl
vpc_id = aws_vpc.main.id
```

### Explicit Dependencies

Used when dependency is not directly referenced:

```hcl
depends_on = [aws_instance.main]
```

---

## 🌳 Dependency Graph

Generate using:

```bash
terraform graph
```

(Optional)

```bash
terraform graph | dot -Tpng > graph.png
```

---

## 🔄 Lifecycle Rules

| Argument              | Purpose                           |
| --------------------- | --------------------------------- |
| create_before_destroy | Avoid downtime during updates     |
| prevent_destroy       | Protect critical resources        |
| ignore_changes        | Ignore specific attribute changes |

---

## 🧠 Key Learnings

* Terraform automatically handles resource dependencies
* Infrastructure components are interconnected
* Explicit dependencies help control execution order
* Lifecycle rules improve reliability and safety

---

## 🚀 Conclusion

Today I built a complete AWS infrastructure stack using Terraform and learned how dependency management works behind the scenes. This is a key step toward building production-ready cloud infrastructure.

---

## 🔖 Tags

#DevOps #Terraform #AWS #InfrastructureAsCode #CloudComputing #TerraWeek #90DaysOfDevOps
