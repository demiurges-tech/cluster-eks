resource "aws_route_table" "ycochet_priv_table" {
  vpc_id = aws_vpc.ycochet_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ycochet_nat.id
  }

  tags = {
    Name = "ycochet_priv_table"
  }
}

resource "aws_route_table_association" "ycochet_ass_priv" {
  count          = length(data.aws_availability_zones.available.names)
  subnet_id      = element(aws_subnet.ycochet_priv.*.id, count.index)
  route_table_id = aws_route_table.ycochet_priv_table.id
}


resource "aws_eip" "ycochet_eip" {}

resource "aws_nat_gateway" "ycochet_nat" {
  allocation_id = aws_eip.ycochet_eip.id
  subnet_id     = element(aws_subnet.ycochet_pub.*.id, 0)
  tags = {
    Name = "ycochet_nat"
  }

}
