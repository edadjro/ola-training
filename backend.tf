terraform {
  backend "s3" {
    bucket = "olatunde"
    key = "tfstate"
    region = "us-east-1"
    dynamodb_table = "ola"
  }
}
