resource "aws_route53_zone" "all_drops_zone" {
  name = var.domain_name
}

# resource "aws_route53_record" "alldrops_record" {
#   zone_id = aws_route53_zone.all_drops_zone.zone_id
#   name    = tolist(aws_acm_certificate.ssl_certificate.domain_validation_options)[0].resource_record_name
#   type    = tolist(aws_acm_certificate.ssl_certificate.domain_validation_options)[0].resource_record_type
#   records = [tolist(aws_acm_certificate.ssl_certificate.domain_validation_options)[0].resource_record_value]
#   ttl     = var.route53_ttl
# }

resource "aws_route53_record" "alldrops_a_record" {
  zone_id = aws_route53_zone.all_drops_zone.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.alldrops_info.domain_name
    zone_id                = aws_cloudfront_distribution.alldrops_info.hosted_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "alldrops_caa_record" {
  zone_id = aws_route53_zone.all_drops_zone.zone_id
  name    = var.domain_name
  type    = "CAA"
  records = [
    "0 issue \"amazon.com\"",
    "0 issuewild \"amazon.com\""
  ]
  ttl = var.route53_ttl
}
