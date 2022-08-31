resource "aws_cloudfront_origin_access_identity" "alldrops_info" {
  comment = aws_s3_bucket.alldrops_info.bucket
}

# data "aws_acm_certificate" "wildcard" {
#   domain   = "*.${var.domain_name}"
#   statuses = ["ISSUED"]
# }

resource "aws_cloudfront_distribution" "alldrops_info" {
  origin {
    domain_name = aws_s3_bucket.alldrops_info.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.alldrops_info.bucket

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.alldrops_info.cloudfront_access_identity_path
    }
  }

  enabled         = true
  is_ipv6_enabled = true
  # default_root_object = "index.html"

  default_cache_behavior {
    target_origin_id       = aws_s3_bucket.alldrops_info.bucket
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 7200
    max_ttl                = 86400

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Environment = "production"
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

