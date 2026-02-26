

terraform {
  backend "s3" {
    bucket         = "vijay-own-scripts"
    key            = "bootstrap/terraform.tfstate"
    region         = "us-east-1"
    use_lockfile = true  #S3 native locking
    encrypt      = true 
  }
}




provider "aws" {
  region = "us-east-1"
}