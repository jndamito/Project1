variable "instance_type" {
  description = "EC2 Instance Type"
  type        = map(any)
  default = {
    dev  = "t2.micro"
    prod = "t2.medium"
  }
}

variable "key_name" {
  type    = string
  default = ""
}

variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = ""
}

/*
variable "env" {
  type    = list(string)
  default = ["dev", "prod"]
}

variable "div" {
  type    = list(string)
  default = ["HR", "Finance", "Engineering"]
}
*/