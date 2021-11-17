resource "aws_dynamodb_table" "quotations-ffhs" {
  name             = "Quotations"
  billing_mode     = "PROVISIONED"
  read_capacity    = 20
  write_capacity   = 20
  hash_key         = "quote"

  attribute {
    name = "quote"
    type = "S"
  }

}