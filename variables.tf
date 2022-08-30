variable "region" {
  description = "AWS default region"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  // Check "Bucket naming rules" before defining a name:
  // https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
  description = "First part of the bucket's name (bucket's full name is auto generated)."
  type        = string
  default     = "alldrops-info-20220826-tcr"
}

variable "domain_name" {
  type    = string
  default = "alldrops.info"
}

variable "minimum_protocol_version" {
  type        = string
  default     = "TLSv1.2_2021"
  description = "Minimum version of the SSL protocol used for HTTPS connections. One of: SSLv3, TLSv1, TLSv1.1_2016, TLSv1.2_2018 , TLSv1.2_2019 and TLSv1.2_2021"
}
