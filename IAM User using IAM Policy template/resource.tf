resource "aws_iam_user" "my-iam-user" {
  name = "my_iam_user_basavraj"
}

resource "aws_iam_access_key" "my-iam-user" {
  user = aws_iam_user.my-iam-user.name
}

resource "aws_iam_user_policy" "name" {
  name = "test"
  user = aws_iam_user.my-iam-user.name
  policy = templatefile("${path.module}/s3-policy.json", {
    bucket_name = "test_iam_policy"
  })
}
