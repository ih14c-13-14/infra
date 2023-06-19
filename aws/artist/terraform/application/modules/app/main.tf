module "s3_log" {
  source  = "./modules/s3-bucket-log"
  service = var.service
  env     = var.env
}

module "s3_frontend_hosting" {
  source     = "./modules/s3-hosting"
  service    = var.service
  env        = var.env
  log_bucket = module.s3_log.bucket
}

module "cf" {
  source                               = "./modules/cf"
  service                              = var.service
  env                                  = var.env
  frontend_bucket_regional_domain_name = module.s3_frontend_hosting.bucket_regional_domain_name
}
