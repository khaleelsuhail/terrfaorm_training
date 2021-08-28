provider "aws" {
  region = "ap-south-1"
  profile = "developer"
}
resource "aws_instance" "web" {
  ami = "ami-0e59237271d3dd068"
  #instance_type = var.instance_type_list[1]
  instance_type = var.instance_type_map["dev"]
  count=2
  tags = {
    "Name" = "${count.index}-Web"
  }
}
/*
variable "instance_type_list" {
  type = list
  default = ["t2.micro","t2.nano","t2.large"]
}
*/
variable "instance_type_map" {
  type = map
  default = {
    dev="t2.nano"
    qa="t2.micro"
    prod="t3.large"
  }
}
