data "aws_availability_zones" "available" {}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["*ubuntu*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

}

