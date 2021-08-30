module "ec2_instance_private" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.1.0"
  # insert the 34 required variables here
  depends_on = [
    module.vpc
  ]
  
  for_each = toset([module.vpc.private_subnets[0],module.vpc.private_subnets[1]])

  name = "${var.environment}-private-host-${each.key}"

  ami                    = data.aws_ami.example.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  #monitoring             = true
  vpc_security_group_ids = [module.private_sg.security_group_id]
  subnet_id              = each.key
  
  tags = local.common_tags

}

