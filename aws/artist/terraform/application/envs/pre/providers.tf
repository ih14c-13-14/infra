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
