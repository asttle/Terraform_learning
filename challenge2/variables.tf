

variable "splunk" {
  default = "8088"
}

variable "dev_vpc_cidr" {
  default = "172.31.0.0/16"
}

variable "protocol" {
  default = "tcp"
}

variable "https_port" {
  default = "443" 
}

variable "dev_vpc_port" {
  default = "8080"
}

variable "prod_app_port" {
  default = "8443"
}



