resource "aws_instance" "prod" {
  ami           = "ami-05c880175794030cd"
  instance_type = "t2.micro"
  count         = 3
  tags = {
    Name = "HelloWorldDev${count.index}"
  }
}

output "instance_id" {
  value = aws_instance.prod[*].id
}
