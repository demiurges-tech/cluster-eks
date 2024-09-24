resource "aws_vpc" "ycochet_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    "Name" = "ycochet_vpc"
  }
}

resource "aws_internet_gateway" "ycochet_ig" {
  vpc_id = aws_vpc.ycochet_vpc.id
  tags = {
    "Name" = "ycochet_internet_gateway"
  }
}

