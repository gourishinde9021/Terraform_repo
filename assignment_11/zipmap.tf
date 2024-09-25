variable instance_name {
	default = ["dev", "prod", "test"]
}

variable instance_type {
	default = ["t2.micro", "t3.medium", "t2.medium"]
}

output instance_type_map {
	value = zipmap(var.instance_name,var.instance_type)
}

# You need to provision 3 ec2 instances using zipmap function

resource "aws_instance" "myawsinstance" {
  ami           = "ami-05c880175794030cd"
  instance_type = values(zipmap(var.instance_name,var.instance_type))
  count         = length(var.instance_name)
  tags = {
    Name = keys(zipmap(var.instance_name,var.instance_type))
  }
}

