module "s3_bucket_module" {
  source      = "./modules/s3"
  bucket_name = "artist-tfstate-management"
}

module "dynamodb_dev_table_module" {
  source     = "./modules/dynamodb"
  table_name = "artist-dev-tfstate-lock-management"
}

module "dynamodb_pre_table_module" {
  source     = "./modules/dynamodb"
  table_name = "artist-pre-tfstate-lock-management"
}
