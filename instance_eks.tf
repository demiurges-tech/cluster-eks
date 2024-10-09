resource "aws_eks_cluster" "grp7_eks" {
  name     = "grp7_eks"
  role_arn = data.aws_iam_role.arn_eks_iam.arn
  version  = var.version_eks


  vpc_config {
    endpoint_public_access  = true
    endpoint_private_access = true
    subnet_ids              = [for subnet in aws_subnet.grp7_pub : subnet.id]
  }

}
