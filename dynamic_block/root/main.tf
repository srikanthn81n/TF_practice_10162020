module "MYSERVER-staging" {
  source = "../module"

  servername = "stageserver"
  
  providers = {
    aws = aws.west2
  }
  ingress_rules = {
    "22" = ["0.0.0.0/0"]
    "443" = ["10.0.0.0/25", "10.0.0.128/25"] 
    "8081" = ["0.0.0.0/0"]
  }
  
}


