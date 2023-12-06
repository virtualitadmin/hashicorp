source "amazon-ebs" "ubuntu" {
  ami_name      = "packer-ubuntu-aws-{{timestamp}}"
  instance_type = "t2.micro"
  region        = "us-west-2"
  source_ami_filter {
    filters = {
      virtualization-type                = "hvm"
      architecture                       = "x86_64"
      name                               = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"
      "block-device-mapping.volume-type" = "gp2"
      root-device-type                   = "ebs"
    }
    owners      = ["099720109477"]
    most_recent = true
  }
  ssh_username = "ubuntu"
}
build {
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
}