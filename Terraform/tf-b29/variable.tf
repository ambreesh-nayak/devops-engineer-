variable "ami_id" {
  type = string 
}

variable "instance_type" {
  type = string
}
variable "key" {
  type = string
}

variable "vpc_cidr_block" {
    type = string
}

variable "subnet_cidr_block" {
  type = string
}

variable "az" {
    type = string
}

variable "public_ip" {
    type = bool
}
