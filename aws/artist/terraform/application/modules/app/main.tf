module "s3_log" {
  source  = "./modules/s3-bucket-log"
  service = var.service
  env     = var.env
}

module "s3_hosting" {
  source     = "./modules/s3-hosting"
  service    = var.service
  env        = var.env
  log_bucket = module.s3_log.bucket
}
