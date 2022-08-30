# -----------------------------------------------------------------------------
# generate inputs
# -----------------------------------------------------------------------------

locals {
  bucket_name = "${var.bucket_name}-${random_pet.this.id}"
}

resource "random_pet" "this" {
  length = 2
  keepers = {
    # Generate new random_pet only when var.bucket_name is changed
    bucket_name = "${var.bucket_name}"
  }
}

# -----------------------------------------------------------------------------
# aws bucket
# -----------------------------------------------------------------------------

resource "aws_s3_bucket" "alldrops_info" {
  bucket = local.bucket_name
}

resource "aws_s3_bucket_website_configuration" "alldrops_info_config" {
  bucket = aws_s3_bucket.alldrops_info.bucket
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "404.html"
  }
}

resource "aws_s3_bucket_policy" "alldrops_info_policy" {
  bucket = aws_s3_bucket.alldrops_info.bucket
  policy = templatefile("s3-policy.json", { bucket = local.bucket_name })
}

# -----------------------------------------------------------------------------
# aws cloudfront
# -----------------------------------------------------------------------------

resource "aws_cloudfront_distribution" "alldrops_info" {
  enabled         = true
  is_ipv6_enabled = true

  origin {
    domain_name = aws_s3_bucket.alldrops_info.bucket_domain_name
    origin_id   = aws_s3_bucket.alldrops_info.bucket
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  default_cache_behavior {
    target_origin_id = aws_s3_bucket.alldrops_info.bucket
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 7200
    max_ttl                = 86400
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
