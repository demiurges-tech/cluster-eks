module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.24.3"


  #count           = length(data.aws_availability_zones.available.names)
  cluster_name    = "ycochet_eks"
  cluster_version = "1.30"

  iam_role_name                            = "EKS_Students"
  cluster_endpoint_public_access           = true
  create_cloudwatch_log_group              = false
  enable_cluster_creator_admin_permissions = true

  cluster_addons = {
    coredns = {}
    #eks-pod-identity-agent = {}
    kube-proxy = {}
    vpc-cni    = {}
  }

  vpc_id                   = aws_vpc.ycochet_vpc.id
  subnet_ids               = ["${element(aws_subnet.ycochet_pub.*.id, 0)}", "${element(aws_subnet.ycochet_pub.*.id, 1)}"]
  control_plane_subnet_ids = ["${element(aws_subnet.ycochet_priv.*.id, 0)}", "${element(aws_subnet.ycochet_priv.*.id, 1)}"]

  # EKS Managed Node Group

  eks_managed_node_groups = {
    example = {
      ami_type       = "CUSTOM"
      ami_id         = data.aws_ami.ubuntu.id
      instance_types = ["t2.micro"]

      min_size     = 1
      max_size     = 10
      desired_size = 1

      key_name = "key_public_ec2"
    }
  }




  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}


