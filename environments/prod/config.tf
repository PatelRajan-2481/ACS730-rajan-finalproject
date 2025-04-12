terraform {
  backend "s3" {
    bucket  = "acs730-rajan-prod-tfstate"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
