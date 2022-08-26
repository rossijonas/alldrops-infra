variable "region" {
  description = "AWS default region"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the bucket hosting the content"
  type        = string
  default     = "alldrops_info_20220826_tcr"
}
