provider "aws" {
  region = "ap-northeast-1"

  access_key = "test"
  secret_key = "test"

  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  default_tags {
    tags = {
      Service     = local.service
      Environment = local.env
      ManagedBy   = "terraform"
    }
  }

  endpoints {
    iam        = "http://localhost:4566"
    kinesis    = "http://localhost:4566"
    lambda     = "http://localhost:4566"
    s3         = "http://localhost:4566"
    cloudfront = "http://localhost:4566"
    sts        = "http://localhost:4566"
  }
}

provider "aws" {
  alias  = "global"
  region = "us-east-1"

  access_key = "test"
  secret_key = "test"

  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  default_tags {
    tags = {
      Service     = local.service
      Environment = local.env
      ManagedBy   = "terraform"
    }
  }

  endpoints {
    iam        = "http://localhost:4566"
    kinesis    = "http://localhost:4566"
    lambda     = "http://localhost:4566"
    s3         = "http://localhost:4566"
    cloudfront = "http://localhost:4566"
    sts        = "http://localhost:4566"
  }
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

