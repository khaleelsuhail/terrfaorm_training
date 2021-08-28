variable "instance_type" {
  default = "t2.micro"
}
variable "key_name" {
  type = string
  description = "enter the key-pair name"  
  default = "AWS"
}

