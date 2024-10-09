terraform {
  backend "s3" {
    bucket = "grp7-state-bucket"
    key    = "terraform.tfstate"
    region = "us-west-1"
  }
}
