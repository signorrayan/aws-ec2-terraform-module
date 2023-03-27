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