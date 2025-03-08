import {
  id = "vpc-0731a061630c3f975"
  to = module.cf_vpc.aws_vpc.this[0]
}

import {
  id = "rtb-01bd1fa350a28b4fd"
  to = module.cf_vpc.aws_route_table.public[0]
}

import {
  id = "igw-0304426491a3162f9"
  to = module.cf_vpc.aws_internet_gateway.this[0]
}

import {
  to = module.cf_vpc.aws_subnet.public[0]
  id = "subnet-0ffc450432719efa3"
}

import {
  to = module.cf_vpc.aws_subnet.public[1]
  id = "subnet-0477227624ef1195a"
}

import {
  to = module.cf_vpc.aws_route.public_internet_gateway[0]
  id = "rtb-01bd1fa350a28b4fd_0.0.0.0/0"
}

import {
  to = module.cf_vpc.aws_route_table_association.public[0]
  id = "subnet-0ffc450432719efa3/rtb-01bd1fa350a28b4fd" #PublicSubnet1/PublicRouteTable
}

import {
  to = module.cf_vpc.aws_route_table_association.public[1]
  id = "subnet-0477227624ef1195a/rtb-01bd1fa350a28b4fd" #PublicSubnet2/PublicRouteTable
}

import {
  to = aws_security_group.ingress
  id = "sg-01b4edfb7b0801ea3"
}