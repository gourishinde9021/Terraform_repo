variable awsinstance {
	default = "ami-05c880175794030cd"
}

variable instancename {
	type = list
        default = ["prod", "dev", "test"]
}

variable instancename1 {
	type = list
	default = ["Akshat","Varun","Umar"]
}

variable awsinstancetype {
	type = list
	default = ["t2.micro","t2.medium","t2.micro"]
}

variable awsiamusers {
	type = list
	default = ["user1", "user2", "user3"]
}
