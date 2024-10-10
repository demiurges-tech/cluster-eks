resource "aws_eks_node_group" "grp7_nodegroup" {
  cluster_name    = aws_eks_cluster.grp7_eks.name
  node_group_name = "grp7_NodeGroup"
  #node_role_arn   = data.aws_iam_role.arn_eks_iam.arn
  node_role_arn = aws_iam_role.node_role.arn
  subnet_ids    = [for subnet in aws_subnet.grp7_pub : subnet.id]

  instance_types = ["t2.micro"]
  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 2
  }

  update_config {
    max_unavailable = 1
  }

}
