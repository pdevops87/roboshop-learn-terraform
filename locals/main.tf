variable "fruits" {
  default = {
    apple = {
      price = 100
    }
    banana = {
      price = 50
    }
    grapes = {
      price = 150
    }
  }
}

#
locals {
  fruits = {for x,y in var.fruits : x => y.price}
}
output "fruits" {
  value = local.fruits
}

# x => y.price maps the key x to y