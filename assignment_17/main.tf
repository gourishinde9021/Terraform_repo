resource "aws_instance" "myec2" {
  ami = "ami-0aa097a5c0d31430a"
  instance_type = "t3.micro"
  key_name = "terraformkey"

  connection {
   type = "ssh"
   user = "ec2-user"
   private_key = file("./terraformkey.pem")
   host = self.public_ip
   }

  provisioner "remote-exec" {
   when = destroy
   inline = [
      "sudo yum install httpd -y",
      "sudo touch file1"
   ]
 }
}

