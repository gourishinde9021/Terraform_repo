provider "aws" {
  region     = "ap-southeast-1"
  access_key = "AKIAXVTO4X6AP2EYXQN3"
  secret_key = "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"
}

resource "aws_instance" "web" {
  count = 3
  ami           = "ami-05c880175794030cd"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
