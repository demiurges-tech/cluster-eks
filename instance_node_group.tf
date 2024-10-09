resource "aws_eks_node_group" "grp5_nodegroup" {
  cluster_name    = aws_eks_cluster.grp5_eks.name
  node_group_name = "grp5_NodeGroup"
  node_role_arn   = data.aws_iam_role.arn_eks_iam.arn
  subnet_ids      = aws_subnet.grp5_pub.*.id

  instance_types = ["t2.micro"]
  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

}
