vpc_name = "myvpc"
vpc_cidr_block = "10.0.0.0/16"
vpc_availability_zones = ["ap-south-1a", "ap-south-1b"]
vpc_public_subnets = ["10.0.0.0/20", "10.0.16.0/20"]
vpc_private_subnets = ["10.0.32.0/20", "10.0.48.0/20"]
vpc_database_subnets= ["10.0.64.0/20", "10.0.80.0/20"]
vpc_create_database_subnet_group = true 
vpc_create_database_subnet_route_table = true   
vpc_enable_nat_gateway = true  
vpc_single_nat_gateway = true