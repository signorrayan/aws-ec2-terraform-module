data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    # https://cloud-images.ubuntu.com/locator/ec2/
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


data "aws_partition" "current" {}


data "aws_iam_policy_document" "assume_role_policy" {
  count = var.create && var.create_iam_instance_profile ? 1 : 0

  statement {
    sid     = "EC2AssumeRole"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.${data.aws_partition.current.dns_suffix}"]
    }
  }
}

