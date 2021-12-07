data "aws_caller_identity" "self" {}

resource "aws_iam_policy" "publish" {
  name = "UploadAndPublishWebsite"
  description = "Allow sync files in S3 and trigger the change in CloudFront"
  policy = templatefile("templates/publish-policy.json", {
    bucket_name = local.bucket_name,
    account_id = data.aws_caller_identity.self.account_id,
    cloud_front_distribution_id = aws_cloudfront_distribution.www_s3_distribution.id
  })
}
