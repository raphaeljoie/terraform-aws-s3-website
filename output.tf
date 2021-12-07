output "cloudfront_dns" {
  value = aws_cloudfront_distribution.www_s3_distribution.domain_name
}
