## Create 10 users from the list of users available in a list

variable "user_list" {
	type = list(string)
	default = ["Tom", "Harry", "Sally", "Aditya", "Akash", "Pooja", "Vinod", "Vedika", "Satish", "Tara"]
}

resource "aws_iam_user" "aws_user" {
  count = length(var.user_list)
  name = var.user_list[count.index]
  path = "/system/"
  tags = {
    Name = var.user_list[count.index]
  }
}
