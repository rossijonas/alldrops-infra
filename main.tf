# -----------------------------------------------------------------------------
# generate inputs
# -----------------------------------------------------------------------------

locals {
  bucket_name = "${var.bucket_name}-${random_pet.this.id}"
}

resource "random_pet" "this" {
  length = 2
  keepers = {
    # Generate new random_pet only when var.bucket_name is changed
    bucket_name = "${var.bucket_name}"
  }
}

# -----------------------------------------------------------------------------
# aws resources
# -----------------------------------------------------------------------------

resource "aws_s3_bucket" "alldrops_info" {
  bucket = local.bucket_name
}

# resource "aws_s3_bucket_acl" "alldrops_info_bucket_acl" {
#   bucket = aws_s3_bucket.alldrops_info.bucket
#   acl    = "private"
# }

resource "aws_s3_bucket_website_configuration" "alldrops_info_config" {
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
  policy = templatefile("s3-policy.json", { bucket = local.bucket_name })
}
