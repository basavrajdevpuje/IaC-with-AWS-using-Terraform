# multiple IAM users
variable "iam_user_name_perfix" {
  type    = string
  default = "my_iam_user"
}

resource "aws_iam_user" "my_iam_users" {
  count = 1
  name  = "${var.iam_user_name_perfix}_${count.index}" # ${}=> interpolation 
}
