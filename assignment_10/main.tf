resource "aws_instance" "web1" {
  ami           = "ami-05c880175794030cd"
  instance_type = "t2.micro"
  count         = max(var.machine_count...)
  tags = {
    Name = "Instance${count.index}"
  }
}
