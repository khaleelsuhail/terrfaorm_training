output "public_ec2_complete_id" {
  description = "The ID of the instance"
  value       = module.ec2_instance_public.id
}


output "public_ec2_complete_public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.ec2_instance_public.public_ip
}

output "private_ec2_complete_id" {
  description = "The ID of the instance"
  value       = [for x in module.ec2_instance_private: x.id]
}

output "private_ec2_complete_public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = [for x in module.ec2_instance_private: x.public_ip]
}



