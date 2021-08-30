module "ec2_instance_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.1.0"
  # insert the 34 required variables here
  name = "${var.environment}-Bastion-host"

  ami                    = data.aws_ami.example.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  #monitoring             = true
  vpc_security_group_ids = [module.public_bastion_sg.security_group_vpc_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = local.common_tags
}
