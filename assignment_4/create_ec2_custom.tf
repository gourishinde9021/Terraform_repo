resource "aws_key_pair" "deployer-key" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
}

resource "aws_vpc" "main" {
  cidr_block = "10.1.0.0/16"
}

resource "aws_security_group" "sg_ec2_1" {
  name        = "sg_ec2_1"
  description = "Allow TLS inbound traffic and all outbound traffic 1"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "sg_ec2_1"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.sg_ec2_1.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}


resource "aws_instance" "ubuntu-vm-instance" {
  ami             = "ami-05c880175794030cd"
  instance_type   = "t3.micro"
  key_name        = aws_key_pair.deployer-key.key_name
  vpc_security_group_ids = [aws_security_group.sg_ec2_1.id]
  tags = {
    Name = "ubuntu-vm"
  }
}
