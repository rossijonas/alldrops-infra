terraform {
  backend "remote" {
    organization = "alldrops"

    workspaces {
      name = "alldrops-infra"
    }
  }

  # backend "local" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.28.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">=3.3.2"
    }
  }
}

provider "aws" {
  region = var.region

  # Make it faster
  skip_get_ec2_platforms      = true
  skip_metadata_api_check     = true
  skip_region_validation      = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true
}

