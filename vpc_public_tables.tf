resource "aws_route_table" "grp5_pub_table" {
  vpc_id = aws_vpc.grp5_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.grp5_ig.id
  }

  tags = {
    Name = "grp5_pub_table"
  }
}

resource "aws_route_table_association" "grp5_ass_pub1" {
  count          = length(data.aws_availability_zones.available.names)
  subnet_id      = element(aws_subnet.grp5_pub.*.id, count.index)
  route_table_id = aws_route_table.grp5_pub_table.id
}

