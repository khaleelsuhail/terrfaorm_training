output "public_ip" {
  value=[for x in aws_instance.web: x.public_ip]
}

output "private_ip" {
  value=[for x in aws_instance.web: x.private_ip]
  
}

output "azone1" {
  value=keys({for az,x in data.aws_ec2_instance_type_offerings.instance_az: az => x.instance_types if length(x.instance_types)!=0})
}
