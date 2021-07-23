resource "aws_instance" "jjtechWeb" {
  ami = var.ami_id
  instance_type = var.instance_type
  security_group = aws_security_group.olaSG.id
  tags = {

  }
}
