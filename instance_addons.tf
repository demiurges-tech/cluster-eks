resource "aws_eks_addon" "example" {
  count        = length(var.addons_eks)
  cluster_name = aws_eks_cluster.ycochet_eks.name
  addon_name   = element(var.addons_eks, count.index)
  
  
  depends_on = [aws_eks_node_group.ycochet_nodegroup]
}
