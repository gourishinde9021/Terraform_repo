variable "istest" {}

resource "aws_instance" "prod" {
  ami           = "ami-05c880175794030cd"
  instance_type = "t2.micro"
  count         = var.istest == true ? 4 : 0
  tags = {
    Name = "HelloWorldProd${count.index}"
  }
}

resource "aws_instance" "dev" {
  ami           = "ami-05c880175794030cd"
  instance_type = "t2.micro"
  count         = var.istest == false ? 2 : 0
  tags = {
    Name = "HelloWorldDev${count.index}"
  }
}
