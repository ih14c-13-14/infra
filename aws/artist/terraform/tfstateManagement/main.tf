module "s3_bucket_module" {
  source      = "./modules/s3"
  bucket_name = "artist-tfstate"
}

module "dynamodb_dev_table_module" {
  source     = "./modules/dynamodb"
  table_name = "artist-dev-tfstate-lock"
}

module "dynamodb_pre_table_module" {
  source     = "./modules/dynamodb"
  table_name = "artist-pre-tfstate-lock"
}
