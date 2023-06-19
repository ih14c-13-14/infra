output "id" {
  value       = aws_s3_bucket.this.id
  description = "ID of the S3 web-hosting bucket"
}

output "bucket" {
  value       = aws_s3_bucket.this.bucket
  description = "name of the S3 web-hosting bucket"
}

output "arn" {
  value       = aws_s3_bucket.this.arn
  description = "ARN of the S3 web-hosting bucket"
}

output "bucket_regional_domain_name" {
  value       = aws_s3_bucket.this.bucket_regional_domain_name
  description = "regional domain name of the S3 web-hosting bucket"
}
