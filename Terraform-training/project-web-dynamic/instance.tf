resource "aws_instance" "web" {
  ami = data.aws_ami.example.id
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    "Name" = var.instance_name
  }
  user_data = file("${path.module}/install.sh")
  vpc_security_group_ids = [ aws_security_group.allow_web.id ]
  
}