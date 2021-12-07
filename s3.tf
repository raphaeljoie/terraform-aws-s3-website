resource "aws_s3_bucket" "bucket" {
  bucket = local.bucket_name

  acl    = "public-read"
  policy = templatefile("templates/s3-policy.json", { bucket = local.bucket_name })

  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://${var.fqdn}"]
    max_age_seconds = 3000
  }

  website {
    index_document = var.index_document
    error_document = var.error_document
  }
}
