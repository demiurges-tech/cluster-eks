resource "aws_vpc" "grp7_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    "Name" = "grp7_vpc"
  }
}

resource "aws_internet_gateway" "grp7_ig" {
  vpc_id = aws_vpc.grp7_vpc.id
  tags = {
    "Name" = "grp7_internet_gateway"
  }
}

