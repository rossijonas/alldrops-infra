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
  default = "aws.alldrops.info"
}

variable "minimum_protocol_version" {
  description = "Minimum version of the SSL protocol used for HTTPS connections. One of: SSLv3, TLSv1, TLSv1.1_2016, TLSv1.2_2018 , TLSv1.2_2019 and TLSv1.2_2021"
  type        = string
  default     = "TLSv1.2_2021"
}

variable "route53_ttl" {
  description = "The amount of time, in seconds, that you want DNS recursive resolvers to cache information about this record"
  type        = number
  default     = 60
}
