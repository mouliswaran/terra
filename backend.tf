terraform {
  backend "s3" {
    bucket = "demo-552022"
    key = "main"
    region = "eu-west-1"
  }
}