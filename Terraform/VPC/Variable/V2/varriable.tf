variable "vpc_cidr_block" {
    type = string
}

variable "subnet_cidr_block" {
  type = list(string)
}

variable "az" {
    type = list(string)
}

variable "public_ip" {
    type = bool
}

variable "ami_id" {
  type = string 
}

variable "instance_type" {
  type = string
}
variable "key" {
  type = string
}

variable "no_public_ip" {
  type = bool
}
