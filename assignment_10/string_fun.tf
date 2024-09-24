## Convert the list of strings to a set and check its length using toset and length . Convert string values to numbers with tonumber

variable "list" {
	default = ["a", "b", "c", "c"]
}

variable "string_number" {
	default = "5"
}

output "list_to_set_unique" {
	value = toset(var.list)
}

output "set_length" {
	value = length(toset(var.list))
}

output "convert_to_number" {
	value = tonumber(var.string_number) + 5
}
