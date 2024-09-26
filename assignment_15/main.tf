module "ec2_instance" {
	source = "./modules/ec2_instances"
	ami_id = "ami-05c880175794030cd"
	instance_type = "t3.medium"
	instance_name = "myfirstinstance"
}

output "instance_id" {
	value = module.ec2_instance.instance_id
}

module "s3_bucket" {
	source = "./modules/s3_bucket"
	s3_bucket_name = "my-tf-s3-bucket-394397384"
}

output "s3_bucket_id" {
	value = module.s3_bucket.s3_bucket_id
}

module "iam_user" {
	source = "./modules/iam_user"
	iam_user1 = "gouri"
}

output "iam_user_id" {
	value = module.iam_user.iam_user_id
}
