resource "aws_instance" "web" {
  ami           = "ami-05c880175794030cd"
  instance_type = var.instancetype[1]

  tags = {
    Name = "HelloWorld"
  }
}

output "ec2myname" {
  value = aws_instance.web.public_ip
}

resource "aws_eip" "lb" {
  instance = aws_instance.web.id
  domain   = "vpc"
}

output "aws-eip" {
  value = aws_eip.lb.public_ip
}
