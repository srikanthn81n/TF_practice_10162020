module "MYSERVER-staging" {
  source = "../module"

  servername = "stageserver"
  // server_port = 8080

}

// module.MYSERVER-staging.aws_instance.MYWEBSERVER.public_ip