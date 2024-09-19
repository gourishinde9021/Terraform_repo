
resource "aws_instance" "web" {
#  count = 3
  ami           = "ami-05c880175794030cd"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

output "ec2myname" {
  value = aws_instance.web.public_ip
}

resource "aws_s3_bucket" "s3_bucket_example" {
  bucket = "39893843-my-tf-test-bucket-1"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

output "s3bucketName" {
  value = aws_s3_bucket.s3_bucket_example.id
}

resource "aws_eip" "lb" {
  instance = aws_instance.web.id
  domain   = "vpc"
}

output "aws-eip" {
  value = aws_eip.lb.public_ip
}
