# the below code is to create a security group to allow any type of ports and all protocols(-1 means to allow all protocols)
resource "aws_security_group" "sg"{
  name = "${var.env}-sg"
  ingress {
    from_port = 0
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol  = "-1"
  }
  egress {
    from_port = 0
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol  = "-1"
  }
  tags = {
    Name = "${var.env}-sg"
  }
}

# how to loop if there are multiple ports in a list?

resource "aws_security_group" "sg" {
  name = "${var.env}-sg"
  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port = ingress.value.from_port
      to_port   = ingress.value.to_port
      cidr_blocks = ["0.0.0.0/0"]
      protocol  = "tcp"
    }
  }
}