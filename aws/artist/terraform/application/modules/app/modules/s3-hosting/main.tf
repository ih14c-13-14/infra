locals {
  suffix      = data.aws_caller_identity.current.account_id
  name        = "${var.service}-${var.env}-web-${local.suffix}"
  filter_name = "${local.name}-request"
}

data "aws_caller_identity" "current" {}

// NOTE: 公開コンテンツなので暗号化する必要がない
// tfsec:ignore:aws-s3-enable-bucket-encryption
resource "aws_s3_bucket" "this" {
  bucket = local.name

  tags = {
    Name = local.name
  }
}

resource "aws_s3_bucket_logging" "this" {
  bucket        = aws_s3_bucket.this.id
  target_bucket = var.log_bucket
  target_prefix = "${aws_s3_bucket.this.id}/"
}

// 改ざん防止
resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.this.id
  restrict_public_buckets = true
  ignore_public_acls      = true
  block_public_policy     = true
  block_public_acls       = true
}

resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_metric" "request" {
  bucket = aws_s3_bucket.this.id
  name   = local.filter_name
}

resource "aws_s3_object" "not_found_page" {
  bucket       = aws_s3_bucket.this.bucket
  key          = "404.html"
  content_type = "text/html"
  content      = file("${path.module}/404/404.html")
  etag         = md5(file("${path.module}/404/404.html"))
}
