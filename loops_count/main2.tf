
resource "aws_iam_user" "user_names" {
  count = length(var.names)
  name = var.names[count.index]
  

}

provider "aws" {
  region     = "us-east-1"
}
