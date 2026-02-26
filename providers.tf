

terraform {
  backend "s3" {
    bucket         = "vijay-own-scripts"
    key            = "bootstrap/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}