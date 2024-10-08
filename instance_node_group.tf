resource "aws_eks_node_group" "ycochet_nodegroup" {
  cluster_name    = aws_eks_cluster.ycochet_eks.name
  node_group_name = "ycochet_NodeGroup"
  node_role_arn   = data.aws_iam_role.arn_eks_iam.arn
  subnet_ids      = aws_subnet.ycochet_pub.*.id

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
