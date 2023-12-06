source "amazon-ebs" "ubuntu" {
  ami_name      = "packer-ubuntu-aws-{{timestamp}}"
  instance_type = "t2.micro"
  region        = "eu-west-2"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-focal-20.04-*-server-*"
      architecture        = "x86_64"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }

    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}
build {
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
}