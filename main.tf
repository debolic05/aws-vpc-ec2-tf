data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  selected_azs = length(var.azs) > 0 ? var.azs : slice(data.aws_availability_zones.available.names, 0, 3)
}

module "network" {
  source               = "./modules/network"
  name                 = "app"
  vpc_cidr             = var.vpc_cidr
  azs                  = local.selected_azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

data "aws_ami" "amzn2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

module "web" {
  source          = "./modules/ec2"
  name            = "web"
  vpc_id          = module.network.vpc_id
  subnet_id       = module.network.public_subnet_ids[0]
  ami_id          = data.aws_ami.amzn2.id
  instance_type   = var.instance_type
  allow_http_cidr = "0.0.0.0/0"
}
