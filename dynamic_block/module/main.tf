resource "aws_instance" "MYWEBSERVER" {
  ami                    = "ami-06b263d6ceff0b3dd"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.MYWEBSERVER_SG.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "<h1>Deployed via Terraform</h1>" >> index.html
              nohup busybox httpd -f -p ${local.server_port} &
              EOF

  tags = {
    Name = var.servername
  }
}

resource "aws_security_group" "MYWEBSERVER_SG" {

  name = "${var.servername}_SG"

  

  dynamic "ingress" {
        for_each = var.ingress_rules
      content{
          from_port = ingress.key
          to_port = ingress.key
          cidr_blocks = ingress.value
          protocol = "tcp"
              }
  }
  
}

/*
resource "aws_security_group_rule" "example" {
  for_each = var.ingress_rules
  type              = "ingress"
  from_port         = each.key
  to_port           = each.key
  protocol          = "tcp"
  cidr_blocks       = each.value
  security_group_id = aws_security_group.MYWEBSERVER_SG.id
}
*/