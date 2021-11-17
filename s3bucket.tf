resource "aws_s3_bucket" "quoteapp-frontend-ffhs-lab" {
  bucket = "my-ffhs-bucket"
  acl    = "private"

  tags = {
    Name        = "FrontEnd"
    Environment = "Test"
  }
}