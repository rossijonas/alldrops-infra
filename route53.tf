resource "aws_route53_zone" "alldrops" {
  name = var.domain_name
}

resource "aws_route53_record" "alldrops_a" {
  zone_id = aws_route53_zone.alldrops.zone_id
  name    = ""
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.alldrops.domain_name
    zone_id                = aws_cloudfront_distribution.alldrops.hosted_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "alldrops_caa" {
  zone_id = aws_route53_zone.alldrops.zone_id
  name    = var.domain_name
  type    = "CAA"
  records = [
    "0 issue \"amazon.com\"",
    "0 issuewild \"amazon.com\""
  ]
  ttl = var.route53_ttl
}
