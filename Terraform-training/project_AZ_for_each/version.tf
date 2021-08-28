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
  region = "ap-south-1"
}