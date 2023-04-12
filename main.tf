resource "aws_instance" "server" {
  # count = local.create ? 1 : 0

  for_each               = toset(local.instance_names)
  ami                    = local.ami_id
  instance_type          = var.instance_type
  cpu_core_count         = var.cpu_core_count
  cpu_threads_per_core   = var.cpu_threads_per_core
  key_name               = var.key_name
  availability_zone      = var.availability_zone
  subnet_id              = var.subnet_id
  vpc_security_group_ids = try(coalesce([aws_security_group.sg_ssh[0].id, aws_security_group.sg_server_outgoing[0].id], var.vpc_security_group_ids), null)
  iam_instance_profile   = var.create_iam_instance_profile ? aws_iam_instance_profile.server[0].name : var.iam_instance_profile
  tags = {
    Name = "${var.name}-${index(local.instance_names, each.key) + 1}"
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


resource "aws_security_group" "sg_server_outgoing" {
  description = "A security group to allow all output traffic."

  count = var.create_sg ? 1 : 0

  name_prefix = "sg_server_outgoing_"
  egress {
    from_port   = local.all_ports
    to_port     = local.all_ports
    protocol    = local.any_protocol
    cidr_blocks = local.all_ips
  }
}

resource "aws_security_group" "sg_ssh" {
  description = "A security group to allow ssh on port 22."

  count = var.create_sg ? 1 : 0

  name_prefix = "sg_ssh_"
  ingress {
    from_port   = local.ssh_port
    to_port     = local.ssh_port
    protocol    = local.tcp_protocol
    cidr_blocks = local.all_ips
  }
}