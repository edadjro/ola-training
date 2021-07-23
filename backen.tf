terraform {
  backend "s3" {
    bucket = "olatunde"
    key = "tfstate"
    region = "us-west-2"
    dynamodb_table = "ola"
  }
}
