output "s3_bucket_id" {
  description = "The name of the bucket."
  value       = aws_s3_bucket.alldrops_info.bucket
}

output "s3_bucket_website_domain_name" {
  description = "The bucket domain name"
  value       = aws_s3_bucket.alldrops_info.bucket_domain_name
}

output "s3_bucket_website_domain" {
  description = "The domain of the website endpoint. This is used to create Route 53 alias records."
  value       = aws_s3_bucket_website_configuration.alldrops_info_config.website_domain
}

output "s3_bucket_website_endpoint" {
  description = "The website endpoint"
  value       = aws_s3_bucket_website_configuration.alldrops_info_config.website_endpoint
}

output "cloudfront_domain_name" {
  description = "The domain name corresponding to the distribution."
  value       = aws_cloudfront_distribution.alldrops_info.domain_name
}

output "route_53_name_servers" {
  description = "A list of name servers in associated delegation set"
  value       = aws_route53_zone.all_drops_zone.name_servers
}
