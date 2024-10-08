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
  default = "1.30"
}

variable "addons_eks" {
  type = list(any)
  default = ["VPC-CNI","CodeDNS","kubeproxy"]

}
