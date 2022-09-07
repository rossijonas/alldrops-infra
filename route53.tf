resource "aws_route53_zone" "alldrops_zone" {
  name = var.domain_name
}

resource "aws_route53_record" "alldrops_a_record" {
  zone_id = aws_route53_zone.alldrops_zone.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.alldrops_info.domain_name
    zone_id                = aws_cloudfront_distribution.alldrops_info.hosted_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "alldrops_caa_record" {
  zone_id = aws_route53_zone.alldrops_zone.zone_id
  name    = var.domain_name
  type    = "CAA"
  records = [
    "0 issue \"amazon.com\"",
    "0 issuewild \"amazon.com\""
  ]
  ttl = var.route53_ttl
}
