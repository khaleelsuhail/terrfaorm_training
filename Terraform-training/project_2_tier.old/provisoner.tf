
resource "null_resource" "name" {
  depends_on = [module.ec2_instance_public]

  connection {
    type     = "ssh"
    host     = aws_eip.bastion_eip.public_ip    
    user     = "ubuntu"
    password = ""
    private_key = file("private-key/terraform-key.pem")
  }  


  provisioner "file" {
    source      = "private-key/terraform-key.pem"
    destination = "/tmp/terraform-key.pem"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/terraform-key.pem"
    ]
  }
  provisioner "local-exec" {
    command = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
    working_dir = "local-exec-output-files/"
    on_failure = continue
  }
}