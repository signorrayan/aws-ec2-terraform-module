locals {
  create             = var.create
  iam_role_name      = try(coalesce(var.iam_role_name, var.name), "")

  instance_names = {
    for i in range(var.instance_count) :
    "${var.environment}-instance-0${i + 1}" => null
  }

}
