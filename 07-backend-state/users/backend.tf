terraform {
  backend "s3" {
    bucket         = "dev-application-backend-state-basav"
    key            = "dev/backend-state-proj/users/bakend-state"
    region         = "us-east-1"
    dynamodb_table = "dev-application-lock"
    encrypt        = true
  }
}

# https://www.techcrumble.net/2020/01/how-to-configure-terraform-aws-backend-with-s3-and-dynamodb-table/
