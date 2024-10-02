module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.0"

  availability_zone      = data.aws_availability_zones.available.names[0]
  subnet_id              = element(aws_subnet.ycochet_pub.*.id, 0)
  vpc_security_group_ids = ["${aws_security_group.security_group_admin.id}"]
  name                   = "ycochet_ec2_manage"
  instance_type          = "t2.micro"
  ami                    = data.aws_ami.ubuntu.id

  key_name = "key_public_ec2"
}

