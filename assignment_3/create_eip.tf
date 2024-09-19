resource "aws_instance" "web-server" {
  count         = 3
  ami           = "ami-05c880175794030cd"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_eip" "lb" {
  count    = 3
  domain   = "vpc"
}

resource "aws_eip_association" "eip_assoc" {
  count         = 3
  instance_id   = aws_instance.web-server[count.index].id
  allocation_id = aws_eip.lb[count.index].id
}

