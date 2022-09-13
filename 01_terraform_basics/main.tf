// Terraform v0.13
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.70.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}



/*# Configure the AWS Provider with V 0.12 and less
provider "aws" {
  region  = "us-east-1"
  version = "~> 3.70.0"
}*/
