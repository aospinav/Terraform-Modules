resource "aws_security_group" "sg_ssh" {
  name        = var.name_sg_ssh
  vpc_id      = var.vpc_id
  description = "Allow ssh access from specifics ips"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ip_range, var.custom_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # todos los protocolos
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "sg_http" {
  name        = var.name_sg_http
  vpc_id      = var.vpc_id
  description = "Allow HTTP access from specific IPs"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ip_range, var.custom_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # todos los protocolos
    cidr_blocks = ["0.0.0.0/0"]
  }

}
resource "aws_security_group" "sg_private_http" {
  name        = var.name_sg_private_http
  vpc_id      = var.vpc_id
  description = "Allow HTTP access from Load Balancer SG"

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_http.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # todos los protocolos
    cidr_blocks = ["0.0.0.0/0"]
  }

}


