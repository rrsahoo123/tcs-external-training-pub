# #setting-up provider
# terraform {
#   backend "s3" {
#     bucket = "rati-ansible-buckets3-18april2023"
#     key    = "non-prod/terraform.tfstate"
#     region = "ap-south-1"
#     dynamodb_table = "rati-tf-locking-mumbai"
#   }
# }



provider "aws" {
    region = "ap-south-1"  
}

provider "archive" {  
}

# write the ec2 instance config 