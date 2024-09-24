# create function to take a list as input, joins them into string and then splits them back to list of names

variable "names" {
	type = list
	default = ["Alice", "Bob", "Charlie"]
}

output "joined_name" {
	value = join(", ", var.names)
}

output "split_names" {
	value = split(", ", join(", ", var.names))
}

variable "city" {
	type = list
	default = ["NY", "Landon", "Paris", "Alice"]
}


# Create a configuration that concatenates two lists, removes duplicates, and calculates total number of elements 
 
output "concatlist" {
	value = concat(var.names, var.city)
}

output "uniquelist"{
	value = distinct(concat(var.names, var.city))
}

output "lenghtoflist" {
	value = length(distinct(concat(var.names, var.city)))
}

# Use min , max and abs functions to calculate the smallest , largest , and absolute values for a set of variables

variable "number1" {
	default = 10
}

variable "number2" {
        default = -5
}

variable "number3" {
        default = 20
}

output "minimum_value" {
	value = min(var.number1, var.number2, var.number3)
}

output "maximum_value" {
        value = max(var.number1, var.number2, var.number3)
}

output "absolute_value" {
        value = min(var.number2)
}
# I have a set of  count as a list ..i want to use terraform function to create maxx machine from the list

variable "machine_count" {
	default = [2, 3, 4, 7]
}

output "maximum_machine_count" {
	value = max(var.machine_count...)
}
