resource "aws_instance" "instance" {
#   check if the block is enabled or not by using count
  count         =  var.create_instance ? 1:0
  ami           = ""
  instance_type = var.env == "qa" ? "t3.micro" : "t2.micro" // condition based
}


variable "create_instance" {
  default = false
}

variable "env"{
  default = "qa"
}


#  sometimes we have to enabled / disabled the block based on expression

