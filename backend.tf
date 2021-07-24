terraform {
  backend "s3" {
    bucket = "olatunde12"
    key = "tfstate"
    region = "us-west-2"
    dynamodb_table = "ola"
  }
}
