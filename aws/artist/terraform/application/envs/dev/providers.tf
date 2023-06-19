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
