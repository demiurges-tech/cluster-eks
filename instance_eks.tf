resource "aws_eks_cluster" "grp5_eks" {
  name     = "grp5_eks"
  role_arn = data.aws_iam_role.arn_eks_iam.arn
  version  = var.version_eks


  vpc_config {
    endpoint_public_access  = true
    endpoint_private_access = true
    subnet_ids              = [for subnet in aws_subnet.grp5_pub : subnet.id]
  }

}
