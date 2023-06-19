variable "service" {
  type        = string
  description = "used for resource name and tag prefix"
}

variable "env" {
  type        = string
  description = "used for resource name and tag prefix"
}

variable "log_bucket" {
  type        = string
  description = "the bucket to write logs"
}
