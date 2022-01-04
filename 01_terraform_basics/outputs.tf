# output for S3 bucket
output "my_s3_bucket_complete_details" {
  value = aws_s3_bucket.my_s3_bucket
}

output "my_s3_bucket_versioning" {
  value = aws_s3_bucket.my_s3_bucket.versioning[0].enabled
}

# output for IAM user
output "my_iam_user_details" {
  value = aws_iam_user.my_iam_user
}
