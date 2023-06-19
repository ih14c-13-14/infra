variable "service" {
  type        = string
  description = "used for resource name and tag prefix"
}

variable "env" {
  type        = string
  description = "used for resource name and tag prefix"
}

variable "frontend_bucket_regional_domain_name" {
  type        = string
  description = "regional domain name of the S3 web-hosting bucket"
}
