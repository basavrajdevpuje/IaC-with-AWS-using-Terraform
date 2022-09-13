# s3 bucket
resource "aws_s3_bucket" "enterprise_backend_state" {
  bucket = "dev-application-backend-state-basav"

  # prevent the state
  # lifecycle {
  #   prevent_destroy = true # prevent the deletion of the specific bucket
  # }

  # to store mutltiple versions of the state and if required go back to previous state
  versioning {
    enabled = true
  }

  # server_side_encryption to store state in encrypted format
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# locking - DynamoDB
resource "aws_dynamodb_table" "enterprise_backend_lock" {
  name         = "dev-application-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID" # attribute name is the value for hash_key
  attribute {
    name = "LockID"
    type = "S"
  }
}
