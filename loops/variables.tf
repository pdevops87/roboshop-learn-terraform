variable "env" {
  default ="dev"
}
variable "ports" {
  default = {
    ssh = 22
    prometheus = 8080
    grafana = 9090
  }
}