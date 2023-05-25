locals {
  eks_cluster_arn = "arn:aws:eks:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:cluster/${local.service}-${local.env}-eks"
}

provider "aws" {
  region = "ap-northeast-1"

  default_tags {
    tags = {
      Service     = local.service
      Environment = local.env
      ManagedBy   = "terraform"
    }
  }
}

provider "aws" {
  alias  = "global"
  region = "us-east-1"

  default_tags {
    tags = {
      Service     = local.service
      Environment = local.env
      ManagedBy   = "terraform"
    }
  }
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}
