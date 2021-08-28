resource "aws_instance" "web" {
  ami = data.aws_ami.example.id
  instance_type=var.instance_type
  key_name = var.key_name
  

  user_data = file("${path.module}/install.sh")
  vpc_security_group_ids = [ aws_security_group.allow_web.id ] #https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#security_groups
  for_each = toset(keys({for az,x in data.aws_ec2_instance_type_offerings.instance_az: az => x.instance_types if length(x.instance_types)!=0}))
  availability_zone=each.key
  tags = {
    "Name" = "ProjectAZ-${each.value}"
  }

}
