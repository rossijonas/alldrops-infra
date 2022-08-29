output "s3_bucket_id" {
  description = "The name of the bucket."
  value       = aws_s3_bucket.alldrops_info.bucket
}

output "s3_bucket_website_arn" {
  description = "The ARN of the bucket"
  value       = aws_s3_bucket.alldrops_info.arn
}

output "s3_bucket_website_domain_name" {
  description = "The bucket domain name"
  value       = aws_s3_bucket.alldrops_info.bucket_domain_name
}
