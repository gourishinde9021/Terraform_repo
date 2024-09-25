data "aws_ami" "amazon_linux" {

    most_recent = true

    filter {
        name   = "name"
	values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
}

resource "aws_instance" "amazon_linux_prod" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  tags = {
    Name = "amazon_linux_prod"
  }
}

## Create datasource for ubuntu ami
data "aws_ami" "ubuntu" {

    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
}

resource "aws_instance" "ubuntu_prod" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  tags = {
    Name = "ubuntu_prod"
  }
}
