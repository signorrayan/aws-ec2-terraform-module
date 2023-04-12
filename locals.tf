locals {
  create        = var.create
  all_ports = 0
  ssh_port = 22
  tcp_protocol = "tcp"
  any_protocol = "-1"
  all_ips = ["0.0.0.0/0"]
  ami_id = try(coalesce(var.ami, data.aws_ami.ubuntu.id), null)
  iam_role_name = try(coalesce(var.iam_role_name, var.name), "")
  instance_names = [
    for i in range(var.instance_count) :
    "${var.environment}-instance-0${i + 1}"
  ]

}
