remote_state {
  backend = "s3"
  config = {
    bucket         = "artist-tfstate"
    key            = "artist/pre/terraform.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "artist-tfstate-lock"
    encrypt        = true
  }
}
