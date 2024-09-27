provider "aws" {
	region = "ap-southeast-2"
}
provider "aws" {
        region = "ap-southeast-1"
	alias = "region2"
	profile = "account2"
}

resource "aws_eip" "eip4" {
	domain = "vpc"
}

resource "aws_eip" "eip3" {
        domain = "vpc"
	provider = aws.region2
}

output "eip2" {
	value = aws_eip.eip4.public_ip
}
