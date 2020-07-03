terraform {
  backend "s3" {
    bucket = "isajohnson-terraform"
    key    = "state/aws-spot-minecraft"
    region = "us-east-1"
  }
}