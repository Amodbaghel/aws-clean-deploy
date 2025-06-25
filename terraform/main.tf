resource "aws_instance" "web" {
  ami           = "ami-09e6f87a47903347c"
  instance_type = "t2.micro"
  key_name      = "amod.pem"   
  vpc_security_group_ids = [aws_security_group.webserver.name]

  tags = {
    Name = "terraform-ec2-instance"
  }
}

resource "aws_security_group" "webserver" {
  name        = "web-security-group"
  description = "Allow SSH and HTTP (3000)"
  ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    ingress{
      from_port   = 3000
      to_port     = 3000
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  
  egress{
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
}
