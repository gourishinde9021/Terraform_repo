resource "aws_s3_bucket" "my-tf-bucket" {
  bucket = var.s3bucketname

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

# creating IAM user

resource "aws_iam_user" "test-user" {
  name = var.iamusername
  path = "/system/"

  tags = {
    tag-key = "firstuser"
  }
}
