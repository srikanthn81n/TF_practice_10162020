module "MYSERVER-staging" {
  source = "../module"

  servername = "stageserver"
  
  providers = {
    aws = aws.west2
  }
  ingress_rules = ["22", "443"]
  
}


