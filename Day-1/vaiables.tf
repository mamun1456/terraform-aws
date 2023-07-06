variable "region" {
  description = "this is aws region"
  default     = "us-east-1"
}

variable "ami_id" {
  type    = string
  default = "ami-06b09bfacae1453cb"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_public_1" {
  type    = string
  default = "10.0.0.0/24"
}

variable "subnet_public_2" {
  type    = string
  default = "10.0.1.0/24"
}

variable "subnet_private_1" {
  type    = string
  default = "10.0.100.0/24"
}

variable "subnet_private_2" {
  type    = string
  default = "10.0.101.0/24"
}

