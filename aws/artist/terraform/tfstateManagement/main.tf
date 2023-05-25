module "s3_bucket_module" {
  source      = "./modules/s3"
  bucket_name = "artist-tfstate"
}
