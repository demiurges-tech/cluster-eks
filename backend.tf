terraform {
  backend "s3" {
    bucket = "ycochet-state-bucket"
    key    = "terraform.tfstate"
    region = "us-west-1"
  }
}
