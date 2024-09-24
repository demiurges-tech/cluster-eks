resource "aws_route_table" "ycochet_pub_table" {
  vpc_id = aws_vpc.ycochet_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ycochet_ig.id
  }

  tags = {
    Name = "ycochet_pub_table"
  }
}

resource "aws_route_table_association" "ycochet_ass_pub1" {
  count          = length(data.aws_availability_zones.available.names)
  subnet_id      = element(aws_subnet.ycochet_pub.*.id, count.index)
  route_table_id = aws_route_table.ycochet_pub_table.id
}

