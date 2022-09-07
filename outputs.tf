output "s3_bucket_website_endpoint" {
  description = "The website endpoint"
  value       = aws_s3_bucket_website_configuration.alldrops.website_endpoint
}

output "cloudfront_domain_name" {
  description = "The domain name corresponding to the distribution."
  value       = aws_cloudfront_distribution.alldrops.domain_name
}

output "route_53_name_servers" {
  description = "A list of name servers in associated delegation set"
  value       = aws_route53_zone.alldrops.name_servers
}

output "route_53_domain" {
  description = "Root domain name"
  value       = aws_route53_record.root.fqdn
}
