variable "names" {
  default = ["hem", "Raj", "Dev", "Sam", "hell"]
  #            |      |      |     
  #default = ["Raj", "Dev", "Sam"]
}

resource "aws_iam_user" "my_iam_user" {
  # count = length(var.names)
  # name  = var.names[count.index]
  for_each = toset(var.names)
  name     = each.value
}
