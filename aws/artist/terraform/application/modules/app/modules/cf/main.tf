locals {
  name = "${var.service}-${var.env}-cf"
  origin_ids = {
    frontend = var.frontend_bucket_regional_domain_name
    backend  = "backend"
  }
}

resource "aws_cloudfront_origin_access_control" "frontend" {
  name                              = "${local.name}-frontend-oac"
  description                       = "${local.name}-frontend-oac"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "distribution" {
  origin {
    domain_name = var.frontend_bucket_regional_domain_name
    origin_id   = local.origin_ids.frontend
    origin_path = "/app"
  }

  origin {
    domain_name = "artist"
    origin_id   = local.origin_ids.frontend
    origin_path = "/app"
  }

  enabled         = true
  is_ipv6_enabled = true

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = local.origin_ids.frontend
    viewer_protocol_policy = "redirect-to-https"
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6" // CachingOptimized: https://docs.aws.amazon.com/ja_jp/AmazonCloudFront/latest/DeveloperGuide/using-managed-cache-policies.html#managed-cache-caching-optimized:~:text=658327ea%2Df89d%2D4fab%2Da63d%2D7e88639e58f6
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
