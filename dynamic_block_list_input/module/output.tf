output "MYWEBSERVER_PUBLIC_IP" {
    value = aws_instance.MYWEBSERVER.public_ip
}