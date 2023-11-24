terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = "~> 1.0"
}

provider "aws" {
  
}

resource "aws_instance" "Maven" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.instance_type["dev"]
  key_name        = var.key_name
  user_data       = file("${path.module}/maven.sh")
  subnet_id       = data.terraform_remote_state.network.outputs.public_subnets[0]
  security_groups = [aws_security_group.ssh.id, aws_security_group.web.id]

  tags = {
    Name = "Maven-Server"
  }
}

resource "aws_instance" "Tomcat" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.instance_type["dev"]
  key_name        = var.key_name
  user_data       = file("${path.module}/tomcat.sh")
  subnet_id       = data.terraform_remote_state.network.outputs.public_subnets[0]
  security_groups = [aws_security_group.ssh.id, aws_security_group.web.id]

  tags = {
    Name = "Tomcat Server"
  }
}

resource "aws_instance" "Nexus" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.instance_type["dev"]
  key_name        = var.key_name
  user_data       = file("${path.module}/nexus.sh")
  subnet_id       = data.terraform_remote_state.network.outputs.public_subnets[0]
  security_groups = [aws_security_group.ssh.id, aws_security_group.web.id]

  tags = {
    Name = "Nexus-Server"
  }
}

resource "aws_instance" "Jenkins" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.instance_type["dev"]
  key_name        = var.key_name
  user_data       = file("${path.module}/jenkins.sh")
  subnet_id       = data.terraform_remote_state.network.outputs.public_subnets[0]
  security_groups = [aws_security_group.ssh.id, aws_security_group.web.id]

  tags = {
    Name = "Jenkins-Server"
  }
}