data "aws_availability_zones" "available" {}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "image-id"
    values = ["ami-09b2477d43bc5d0ac"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

}

