resource "aws_s3_bucket" "s3_bucket_example" {
  bucket = var.s3_bucket_name

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
