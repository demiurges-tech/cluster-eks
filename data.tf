data "aws_availability_zones" "available" {}

data "aws_ami" "almalinux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["*var.image-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

}

