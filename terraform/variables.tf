variable "adis-vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
}

variable "adish-my_ip" {
  description = "My public IP for SSH access"
  default     = "203.0.113.25/32"
}

variable "ami_id" {
  type    = string
  default = "ami-018ff7ece22bf96db"
}

variable "instance_type" {
  type    = string
  default = "t3.medium"
}

variable "key_name" {
  type    = string
  default = "MERNAppDeployment"
}


variable "tags_name_web" {
  type    = string
  default = "adish-mern-web-server"
}

variable "tags_name_db" {
  type    = string
  default = "adish-mern-db-server"
}