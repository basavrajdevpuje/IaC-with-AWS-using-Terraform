variable "environment" {
  default = "default"
}

resource "aws_iam_user" "my_iam_user" {
  name = "my_iam_user-${var.environment}"
}
