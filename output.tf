output "az_check" {
  value = data.aws_availability_zones.available
}

output "iso" {
  value = data.aws_ami.almalinux
}
