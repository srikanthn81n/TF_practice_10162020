resource "aws_instance" "MYWEBSERVER" {
  ami                    = "ami-06b263d6ceff0b3dd"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.MYWEBSERVER_SG.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "<h1>Deployed via Terraform</h1>" >> index.html
              echo "Hello, World" >> index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF

  tags = {
    Name = var.servername
  }
}

resource "aws_security_group" "MYWEBSERVER_SG" {

  name = "${var.servername}_SG"

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

