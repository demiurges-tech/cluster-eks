resource "aws_security_group" "security_group_admin" {
  name        = "grp5_sg_adm"
  description = "Allow HTTPS, HTTP, SSH"
  vpc_id      = aws_vpc.grp5_vpc.id

  tags = {
    Name = "allow_admin"
  }
}
