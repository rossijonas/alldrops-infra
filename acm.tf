resource "aws_acm_certificate" "ssl_certificate" {
  domain_name       = var.domain_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name : var.domain_name
  }
}

resource "aws_acm_certificate_validation" "alldrops" {
  certificate_arn         = aws_acm_certificate.ssl_certificate.arn
  validation_record_fqdns = [aws_route53_record.record.fqdn, aws_route53_record.root.fqdn, aws_route53_record.caa.fqdn]
}
