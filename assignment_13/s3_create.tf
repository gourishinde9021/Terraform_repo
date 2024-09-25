resource "aws_s3_bucket" "s3example" {
  bucket = "my-tf-test-bucket-9933458983"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
