module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.0"

  name           = "my-ec2-instance"
  instance_type  = "t2.micro"
  ami            = data.aws_ami.almalinux.id
  #key_name       = "my-key"
}

