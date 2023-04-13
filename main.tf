#setting-up provider
terraform {
  backend "s3" {
    bucket = "mmyada1"
    key    = "terraform-state-file/non-prod/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "rati-tf-dy-db-locking"
  }
}


provider "aws" {
    region = "us-east-1"  

}

# write the ec2 instance config 