# resource to create the S3 Bucket
resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "trial-s3-bucket-basavraj-002"
  versioning {
    enabled = true
  }
}

# resource to create the IAM User
resource "aws_iam_user" "my_iam_user" {
  name = "my-iam-user-trial_updated"
}
