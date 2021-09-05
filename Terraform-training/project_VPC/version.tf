terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.54.0"
     }
  }
}

provider "aws" {
  profile = "developer"
  region = var.aws_region
}