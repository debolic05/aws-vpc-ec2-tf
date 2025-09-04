variable "region" {
  type = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "azs" {
  type    = list(string)
  default = []
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.0.0/20","10.0.16.0/20","10.0.32.0/20"]
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.128.0/20","10.0.144.0/20","10.0.160.0/20"]
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}