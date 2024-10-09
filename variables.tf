variable "region_s3" {
  type    = string
  default = "us-west-1"
}

variable "region" {
  type    = string
  default = "us-west-1"
}

variable "image" {
  type    = string
  default = "ubuntu"
}

variable "role_iam_eks" {
  type    = string
  default = "EKS_Students"
}


variable "version_eks" {
  type    = string
  default = "1.31"
}

variable "addons_eks" {
  type    = list(any)
  default = ["vpc-cni", "coredns", "kube-proxy"]

}
