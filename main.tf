resource "aws_instance" "server" {
  # count = local.create ? 1 : 0

  for_each               = local.instance_names
  ami                    = try(coalesce(var.ami, data.aws_ami.ubuntu.id), null)
  instance_type          = var.instance_type
  cpu_core_count         = var.cpu_core_count
  cpu_threads_per_core   = var.cpu_threads_per_core
  key_name               = var.key_name
  availability_zone      = var.availability_zone
  subnet_id              = var.subnet_id
  vpc_security_group_ids = try(coalesce(var.vpc_security_group_ids, [aws_security_group.sg_ssh.id, aws_security_group.sg_server.id]), null)
  iam_instance_profile   = var.create_iam_instance_profile ? aws_iam_instance_profile.server[0].name : var.iam_instance_profile
  tags = {
    Name = each.key
  }
}


resource "aws_iam_role" "server" {
  count = var.create && var.create_iam_instance_profile ? 1 : 0

  name                  = var.iam_role_use_name_prefix ? null : local.iam_role_name
  name_prefix           = var.iam_role_use_name_prefix ? "${local.iam_role_name}-" : null
  assume_role_policy    = data.aws_iam_policy_document.assume_role_policy[0].json
  force_detach_policies = true
}


resource "aws_iam_instance_profile" "server" {
  count = var.create && var.create_iam_instance_profile ? 1 : 0

  role = aws_iam_role.server[0].name

  name        = var.iam_role_use_name_prefix ? null : local.iam_role_name
  name_prefix = var.iam_role_use_name_prefix ? "${local.iam_role_name}-" : null

  # path        = var.iam_role_path
  # tags = merge(var.tags, var.iam_role_tags)

  lifecycle {
    create_before_destroy = true
  }
}

