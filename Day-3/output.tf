output "ec2_public" {
  value = data.aws_ami.amazon_linux.id

}

output "ec2_private" {
  value = data.aws_ami.amazon_linux.id

}