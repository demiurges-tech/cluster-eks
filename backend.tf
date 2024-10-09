terraform {
  backend "s3" {
    bucket         = "my-hyla-state-bucket"
    key            = "terraform.tfstate"
    region         = "us-west-2"
  }
}
