terraform {
  backend "s3" {
    bucket = "grp5-state-bucket"
    key    = "terraform.tfstate"
    region = "us-west-1"
  }
}
