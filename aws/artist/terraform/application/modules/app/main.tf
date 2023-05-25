module "s3_log" {
  source  = "./modules/s3-bucket-log"
  service = var.service
  env     = var.env
}
