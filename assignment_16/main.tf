resource "aws_instance" "prod" {
  ami           = "ami-05c880175794030cd"
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld"
  }
}
