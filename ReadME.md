# AWS VPC with Public/Private Subnets and a Public EC2 (HTTP-ready)

This Terraform provisions:
- A VPC (10.0.0.0/16)
- Three public subnets across distinct AZs with internet access via an Internet Gateway
- Three private subnets across distinct AZs with no direct internet connectivity
- One EC2 instance in a public subnet with a security group that allows TCP/80 from the internet

## Requirements
- Terraform >= 1.5
- AWS credentials configured

## Configuration
Variables with sensible defaults:
- `region` (default: `us-east-1`)
- `vpc_cidr` (default: `10.0.0.0/16`)
- `public_subnet_cidrs` (3 CIDRs)
- `private_subnet_cidrs` (3 CIDRs)
- `azs` (optional; if omitted, the first 3 available AZs in the region are used)
- `instance_type` (default: `t3.micro`)

The EC2 AMI is set to the latest Amazon Linux 2 for the region automatically.