locals {
  common_tags = {
    owner   = "DevOpsTeam"
    service = "backend"
    company = "Google"
    Name    = "Gouri"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-05c880175794030cd"
  instance_type = "t3.micro"

  tags = local.common_tags
}

resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = "ap-southeast-1b"
  size              = 8
  tags              = local.common_tags
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sde"
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = aws_instance.web.id
}
