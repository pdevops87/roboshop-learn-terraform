variable "ports" {
  default = {
    ssh          = 22
    prometheus   = 8080
    grafana      = 8080
  }
}

output "list" {
  value = [for x,y in var.ports : y]
}

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

output "fruits" {
  value = {for x,y in var.fruits : x => y.price}
}