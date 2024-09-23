resource "aws_instance" "web111" {
  count = 3
  ami           = var.awsinstance
  instance_type = "t3.micro"

  tags = {
    Name = "myinstance${count.index + 1}"
  }
}

## Create instances with different names

resource "aws_instance" "web" {
  count = 3
  ami           = var.awsinstance
  instance_type = "t3.micro"

  tags = {
    Name = var.instancename[count.index]
  }
}

resource "aws_instance" "customweb" {
  count = 3
  ami           = var.awsinstance
  instance_type = var.awsinstancetype[count.index]

  tags = {
    Name = var.instancename1[count.index]
  }
}

# create an IAM user with three different names

resource "aws_iam_user" "testusers" {
  count = 3
  name = var.awsiamusers[count.index]
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}
