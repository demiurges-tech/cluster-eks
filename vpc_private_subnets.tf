resource "aws_subnet" "ycochet_priv" {
  count             = length(data.aws_availability_zones.available.names)
  vpc_id            = aws_vpc.ycochet_vpc.id
  cidr_block        = "10.0.${10 + count.index}.0/24"
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "ycochet_subnet_private${count.index}"
  }
}
