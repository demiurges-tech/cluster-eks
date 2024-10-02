module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.0"

  availability_zone = data.aws_availability_zones.available.names[0]
  subnet_id         = element(aws_subnet.ycochet_pub.*.id, 0)

  name          = "ycochet_ec2_manage"
  instance_type = "t2.micro"
  ami           = data.aws_ami.almalinux.id

  #key_name       = "my-key"
}

