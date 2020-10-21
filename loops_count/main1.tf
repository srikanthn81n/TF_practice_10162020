/*
resource "aws_iam_user" "user_names" {
  count = 3
  name = "terrauser.${count.index}"
  

}

provider "aws" {
  region     = "us-east-1"
}
*/