provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region = "us-west-1"
  alias = "west2"
}