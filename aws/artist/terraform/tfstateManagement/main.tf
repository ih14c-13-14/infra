module "s3_bucket_module" {
  source      = "./modules/s3"
  bucket_name = "artist-tfstate"
}

module "dynamodb_table_module" {
  source     = "./modules/dynamodb"
  table_name = "artist-tfstate-lock"
}
