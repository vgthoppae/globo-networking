provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}

locals {
  common_tags = {
    environment = var.environment
  }
}

module "cf_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.prefix
  cidr = "10.42.0.0/16"

  azs                     = slice(data.aws_availability_zones.available.names, 0, length(var.public_subnets))
  public_subnets          = [for k, v in var.public_subnets : v]
  public_subnet_names     = [for k, v in var.public_subnets : "${var.prefix}-${k}"]
  enable_dns_hostnames    = true
  public_subnet_suffix    = ""
  public_route_table_tags = { Name = "${var.prefix}-public" }
  map_public_ip_on_launch = true

  tags = local.common_tags


}

resource "aws_security_group" "ingress" {
  description = "Security group with no ingress rule"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress                = []
  name                   = "no-ingress-sg"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all               = {}
  vpc_id                 = module.cf_vpc.vpc_id
}