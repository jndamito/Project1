variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["172.32.1.0/24", "172.32.2.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["172.32.4.0/24", "172.32.5.0/24", "172.32.6.0/24", "172.32.7.0/24", "172.32.8.0/24", "172.32.9.0/24", "172.32.10.0/24"]
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-east-2a", "us-east-2b"]
}

variable "private_subnet_names" {
  type = list(string)
  default = [ "Private_subnet1_nlb", "Private_subnet2_nlb", "Private_subnet3_app", "Private_subnet4_app", "Private_subnet5_nginx", "Private_subnet6_nginx", "Private_subnet7_maven" ]
}

variable "public_subnet_names" {
  type = list(string)
  default = [ "Public_subnet_NLB_NAT_1", "Public_subnet_NLB_NAT_2" ]
}

# variable "instance_key_pair" {
#   type        = string
#   description = "EC2 instance key pair name"
# }