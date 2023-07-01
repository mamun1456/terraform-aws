resource "aws_instance" "aws_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "EC2-1"
  }

}