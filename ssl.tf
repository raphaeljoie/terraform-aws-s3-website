resource "aws_acm_certificate" "ssl_certificate" {
  # To use an ACM certificate with CloudFront, make sure you request (or import) the certificate in the US East
  # (N. Virginia) Region (us-east-1)
  # source: https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/cnames-and-https-requirements.html
  provider                  = aws.acm_provider
  domain_name               = var.ssl_domain_name
  subject_alternative_names = ["*.${var.ssl_domain_name}"]
  validation_method         = "EMAIL"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "cert_validation" {
  provider        = aws.acm_provider
  certificate_arn = aws_acm_certificate.ssl_certificate.arn
}
