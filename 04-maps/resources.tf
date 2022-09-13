variable "users" {
  default = {
    dev : { country : "Germany", role : "IOS developer" },
    sam : { country : "USA", role : "Web developer" },
    patrik : { country : "Austria", role : "DEVOPS engineer" }
  }
}

resource "aws_iam_user" "my_iam_user" {
  for_each = var.users
  name     = each.key
  tags = {
    country : each.value.country
    role : each.value.role
  }
}
