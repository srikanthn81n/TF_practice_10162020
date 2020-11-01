/*
variable "server_port" {
        description = "The port server will use for HTTP requests"
        type = number
        }
*/
variable "servername" {
    type = string
    }

variable "ingress_rules" {
    type = map(list(string))

}