output "vpc_id" {
  value = module.cf_vpc.vpc_id
  description = "The ID of the VPC"
}

output "vpc_cidr_block" {
  value = module.cf_vpc.vpc_cidr_block
  description = "The CIDR block of the VPC"
}

output "public_subnets" {
  value = module.cf_vpc.public_subnets
  description = "The IDs of the public subnets"
}