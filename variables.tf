variable "region" {
  description = "AWS default region"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "First part of the bucket's name (bucket's full name is auto generated)."
  type        = string
  default     = "alldrops_info_20220826_tcr"
}

variable "domain_name" {
  type    = string
  default = "alldrops.info"
}


