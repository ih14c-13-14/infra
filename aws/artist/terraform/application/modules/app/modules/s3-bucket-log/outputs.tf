output "bucket" {
  value       = aws_s3_bucket.this.bucket
  description = "bucket name of the S3 bucket"
}
