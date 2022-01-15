variable "ip_addr_range" {
  type    = string
  default = "10.0.0.0/16"
}

variable "ubuntu_version" {
  type    = string
  default = "16.04"
}

variable "isfree" {
  type    = bool
  default = false
}

variable "nsg_inbound_ports_list" {
  type    = list(any)
  default = [80, 443, 22, 23, 21]
}