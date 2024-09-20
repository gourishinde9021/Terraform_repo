1) Create a s3 bucket ....via tf script without variables
 
2) Now use variables on the s3 bucket name ...with just variables.tf file 
 
3) Now lets say we dont have access to variables.tf ...but from command line interface we need to create s3 bucket with other name  ...how we can do it?
   
   terraform apply -var="s3bucketname=g-5943423-my-tf-bucket"

4) create a file with terraform.tfvars file and put the custom value there....and run terraform apply..how it will work?
   
5) Create a file with prod.tfvars and define the s3 name there ...how will yyou use apply

   terraform apply -var-file="prod.tfvars"

6) Create an IAM user ...but the name should always be asked from the command line interface whenever we apply the code
