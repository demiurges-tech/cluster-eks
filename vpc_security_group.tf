resource "aws_security_group" "security_group_admin" {
  name        = "ycochet_sg_adm"
  description = "Allow HTTPS, HTTP, SSH"
  vpc_id      = aws_vpc.ycochet_vpc.id

  tags = {
    Name = "allow_admin"
  }
}
