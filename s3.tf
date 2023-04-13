resource "aws_s3_bucket" "example" {
  bucket = "my-tf-rati-bucket"

  tags = {
    Name        = "rati test bucket"
    Environment = "Dev"
  }
}