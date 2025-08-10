resource "aws_security_group" "sg-group" {
  name        = "allow-ssh"
  description = "Permitir trafego ssh"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH allow"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ssh"
  }
}

resource "aws_instance" "ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.sg-group.id]
  associate_public_ip_address = true

  tags = {
    Name = var.instance_name
  }
}