data "aws_iam_policy_document" "alldrops_bucket_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.alldrops_info.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.alldrops.iam_arn]
    }
  }

  statement {
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.alldrops_info.arn]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.alldrops.iam_arn]
    }
  }
}

resource "aws_s3_bucket" "alldrops_info" {
  bucket = local.bucket_name
}

resource "aws_s3_bucket_acl" "alldrops" {
  bucket = aws_s3_bucket.alldrops_info.id
  acl    = "private"
}

resource "aws_s3_bucket_website_configuration" "alldrops" {
  bucket = aws_s3_bucket.alldrops_info.bucket
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "404.html"
  }
}

resource "aws_s3_bucket_policy" "alldrops_info_policy" {
  bucket = aws_s3_bucket.alldrops_info.bucket
  policy = data.aws_iam_policy_document.alldrops_bucket_policy.json
}

resource "aws_s3_bucket_public_access_block" "alldrops" {
  bucket = aws_s3_bucket.alldrops_info.id

  block_public_acls   = true
  block_public_policy = true
}

