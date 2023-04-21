resource "aws_s3_bucket" "rati-s3-bucket" {
  bucket = "my-tf-rati-bucket"
  force_destroy = true
 }

 resource "aws_s3_bucket_public_access_block" "rati-s3-bucket" {
   bucket = "my-tf-rati-bucket"
   block_public_acls = true
   block_public_policy = true
   ignore_public_acls = true
   restrict_public_buckets = true
 }