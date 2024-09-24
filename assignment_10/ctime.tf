## Create a configuration that outputs the current time and calculates the time 30 minutes from now using timeadd function

output "current_time_RFC" {
  value = timestamp()
}

output "min30_ahead" {
  value = timeadd(timestamp(), "30m")
}
