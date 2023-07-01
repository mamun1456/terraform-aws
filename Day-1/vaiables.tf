variable "region" {
  description = "this is for aws region"
  default     = "us-east-1"
}

variable "ami_id" {
  type    = string
  default = "ami-00b3e95ade0a05b9b"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}