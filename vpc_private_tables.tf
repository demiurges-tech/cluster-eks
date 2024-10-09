resource "aws_route_table" "grp7_priv_table" {
  vpc_id = aws_vpc.grp7_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.grp7_nat.id
  }

  tags = {
    Name = "grp7_priv_table"
  }
}

resource "aws_route_table_association" "grp7_ass_priv" {
  count          = length(data.aws_availability_zones.available.names)
  subnet_id      = element(aws_subnet.grp7_priv.*.id, count.index)
  route_table_id = aws_route_table.grp7_priv_table.id
}


resource "aws_eip" "grp7_eip" {}

resource "aws_nat_gateway" "grp7_nat" {
  allocation_id = aws_eip.grp7_eip.id
  subnet_id     = element(aws_subnet.grp7_pub.*.id, 0)
  tags = {
    Name = "grp7_nat"
  }

}
