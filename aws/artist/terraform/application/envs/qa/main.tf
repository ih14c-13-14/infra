locals {
  service = "artist"
  env     = "qa"
}

// このterraformスタックをデプロイするためのIAMロールなので読み取りのみ
# TODO: この辺りやる
# data "aws_iam_role" "iac_deployment_role" {
#   name = "${local.service}-shared-iac-deployment-role"
# }

module "app" {
  providers = {
    aws        = aws
    aws.global = aws.global
  }

  source  = "../../modules/app"
  service = local.service
  env     = local.env
}

