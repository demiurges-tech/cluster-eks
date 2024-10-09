resource "aws_instance" "grp5_ec2" {
  availability_zone      = data.aws_availability_zones.available.names[0]
  subnet_id              = element(aws_subnet.grp5_pub.*.id, 0)
  vpc_security_group_ids = ["${aws_security_group.security_group_admin.id}"]

  instance_type = "t2.micro"
  ami           = data.aws_ami.ubuntu.id
  key_name      = "key_public_ec2"
  tags = {
    Name = "grp5_ec2"
  }

}

