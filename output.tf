output "az_check" {
  value = data.aws_availability_zones.available
}

output "iso" {
  value = data.aws_ami.image
}

output "var" {
  value = var.addons_eks
}

