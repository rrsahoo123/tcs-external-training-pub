#setting-up provider
terraform {
  backend "s3" {
    bucket = "rati-tfstate"
    key    = "terraform-state-file/non-prod/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "rati-tf-locking-mumbai"
  }
}



provider "aws" {
    region = "ap-south-1"  
}

# write the ec2 instance config 