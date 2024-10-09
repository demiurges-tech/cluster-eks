resource "aws_subnet" "grp5_pub" {
  count                   = length(data.aws_availability_zones.available.names)
  vpc_id                  = aws_vpc.grp5_vpc.id
  cidr_block              = "10.0.${count.index}.0/24"
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "grp5_subnet_public${count.index}"
  }
}

