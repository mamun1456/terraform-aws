region              = "us-east-1"
availability_zones  = ["us-east-1a", "us-east-1b", "us-east-1c"]
env                 = "QA"
instance_type       = "t2.micro"
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidr  = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidr = ["10.0.100.0/24", "10.0.101.0/24", "10.0.102.0/24"]

