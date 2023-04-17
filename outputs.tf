output "id" {
  description = "The ID of the instance"
  value       = try({ for srv in aws_instance.server : srv.tags.Name => srv.id }, "")
}

output "arn" {
  description = "The ARN of the instance"
  value       = try({ for srv in aws_instance.server : srv.tags.Name => srv.arn }, "")
}

output "instance_state" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = try({ for srv in aws_instance.server : srv.tags.Name => srv.instance_state }, "")
}

output "primary_network_interface_id" {
  description = "The ID of the instance's primary network interface"
  value       = try({ for srv in aws_instance.server : srv.tags.Name => srv.primary_network_interface_id }, "")
}

output "private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = try({ for srv in aws_instance.server : srv.tags.Name => srv.private_dns }, "")
}

output "public_dns" {
  description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = try({ for srv in aws_instance.server : srv.tags.Name => srv.public_dns }, "")
}

output "public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = try({ for srv in aws_instance.server : srv.tags.Name => srv.public_ip }, "")
  # value       = try(aws_instance.server[0].public_ip, "")
}

output "private_ip" {
  description = "The private IP address assigned to the instance."
  value       = try({ for srv in aws_instance.server : srv.tags.Name => srv.private_ip }, "")
}


# IAM role and Instance Profile
# =============================

output "iam_role_name" {
  description = "The name of the IAM role"
  value       = try([for srv in aws_iam_role.server : srv.name], null)
  # value       = try(aws_iam_role.server[0].name, null)
}

output "iam_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the IAM role"
  value       = try([for srv in aws_iam_role.server : srv.arn], null)
  # value       = try(aws_iam_role.server[0].arn, null)
}

output "iam_role_unique_id" {
  description = "Stable and unique string identifying the IAM role"
  value       = try([for srv in aws_iam_role.server : srv.unique_id], null)
}

output "security_groups" {
  value = try({for srv in aws_instance.server : srv.tags.Name => srv.vpc_security_group_ids}, "")
}