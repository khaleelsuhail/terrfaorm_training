resource "aws_instance" "web" {
  ami = "ami-04db49c0fb2215364"
  instance_type = "t2.micro"
  key_name = "AWS"
  tags = {
    "Name" = "lwplabsUI"
  }
  user_data = file("${path.module}/install.sh")

}