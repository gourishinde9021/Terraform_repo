variable "sg_ports" {
  description = "List of ingress ports"
  type        = list(string)
  default     = [ 8200, 8201, 8300, 9200, 9500 ]
}

resource "aws_security_group" "example_sg" {
  name = "example_security_group"
  dynamic "ingress" {
    for_each = var.sg_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

}
