# s3_module/main.tf

variable "bucket_name" {
	description = "The name of the S3 bucket."
	type        = string
}

resource "aws_s3_bucket" "bucket" {
	bucket = var.bucket_name
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
	bucket = aws_s3_bucket.bucket.id
	versioning_configuration {
		status = "Enabled"
	}
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_sse" {
	bucket = aws_s3_bucket.bucket.id

	rule {
		apply_server_side_encryption_by_default {
			sse_algorithm = "AES256"
		}
	}
}

# resource "aws_s3_bucket_acl" "bucket_acl" {
# 	bucket = aws_s3_bucket.bucket.id
# 	acl = "private"
# }
