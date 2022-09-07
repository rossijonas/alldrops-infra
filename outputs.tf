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
  value       = aws_route53_zone.alldrops_zone.name_servers
}

output "route_53_domain" {
  description = "A list of name servers in associated delegation set"
  value       = aws_route53_record.alldrops_a_record.fqdn
}
