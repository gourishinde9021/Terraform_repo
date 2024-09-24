variable "instance_names" {
  default = ["web", "dev", "test"]
}

resource "aws_instance" "prod" {
  ami           = "ami-05c880175794030cd"
  instance_type = "t2.micro"
  count         = length(var.instance_names)
  tags = {
    Name = element(var.instance_names, count.index)
  }
}
