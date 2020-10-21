resource "aws_instance" "First_EC2" {
  ami                    = "ami-06b263d6ceff0b3dd"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.First_EC2_SG.id]

  tags = {
    Name = "First_EC2"
  }
}

resource "aws_security_group" "First_EC2_SG" {

  name = "First_EC2_SG"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "Second_EC2" {
  ami                    = "ami-06b263d6ceff0b3dd"
  instance_type          = "t2.micro"
  
  tags = {
    Name = "Second_EC2"
  }
  depends_on = [ aws_instance.First_EC2 ]
}
