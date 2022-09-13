# data "template_file" "mydata" {
#   template = file("s3-policy.json")
#   vars = {
#     "bucket_name" = "${var.bucket_name}"
#   }
# }

resource "aws_iam_policy" "mypolicy" {
  name = var.policy-name
  policy = templatefile("${path.module}/s3-policy.json", {
    bucket_name = "dev-env"
  })
}
output "name" {
  value = aws_iam_policy.mypolicy
}
