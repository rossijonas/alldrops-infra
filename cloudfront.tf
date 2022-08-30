resource "aws_cloudfront_origin_access_identity" "alldrops_info" {
  comment = "Identity used to allow Cloudfront access to S3"
}

# data "aws_acm_certificate" "wildcard" {
#   domain   = "*.${var.domain_name}"
#   statuses = ["ISSUED"]
# }

resource "aws_cloudfront_distribution" "alldrops_info" {
  enabled             = true
  default_root_object = "index.html"
  aliases             = [aws_s3_bucket.alldrops_info.bucket]

  origin {
    domain_name = aws_s3_bucket.alldrops_info.bucket_domain_name
    origin_id   = aws_s3_bucket.alldrops_info.bucket

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.alldrops_info.cloudfront_access_identity_path
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

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

  // Replace default CloudFront 403 error
  custom_error_response {
    error_caching_min_ttl = 3600
    error_code            = 403
    response_code         = 403
    response_page_path    = "/404.html"
  }

  viewer_certificate {
    cloudfront_default_certificate = true
    #    acm_certificate_arn      = data.aws_acm_certificate.wildcard.arn
    #    ssl_support_method       = "sni-only"
    #    minimum_protocol_version = var.minimum_protocol_version
  }
}

