resource "aws_eks_cluster" "ycochet_eks" {
  name     = "ycochet_eks"
  role_arn = data.aws_iam_role.arn_eks_iam.arn
  version  = var.version_eks


  vpc_config {
    endpoint_public_access  = true
    endpoint_private_access = true
    subnet_ids              = ["${element(aws_subnet.ycochet_pub.*.id, 0)}", "${element(aws_subnet.ycochet_pub.*.id, 1)}"]
  }

}