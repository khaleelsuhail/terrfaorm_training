module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.6.0"
  # insert the 19 required variables here
  name = "my-vpc"
  cidr = "10.0.0.0/16" # 10.0.0.0/8 is reserved for EC2-Classic

  azs                 = ["ap-south-1a", "ap-south-1b"]
  private_subnets     = ["10.0.0.0/20", "10.0.16.0/20"]
  public_subnets      = ["10.0.32.0/20", "10.0.48.0/20"]
  database_subnets    = ["10.0.64.0/20", "10.0.80.0/20"]
  enable_nat_gateway=true
  single_nat_gateway=true
  enable_dns_hostnames=true
  public_subnet_tags = {
      Type="public-subnets"
  }
  private_subnet_tags={
      Type="private-subnets"
  }
  database_subnet_tags={
      Type="database-subnets"
  }
  
  tags = {
    Owner       = "user"
    Environment = "dev"
  }
}
