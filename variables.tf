variable "region" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "public_subnet_cidr_block" {
  type = string
}

variable "public_subnet_name" {
  type = string
}

variable "private_subnet_cidr_block" {
  type = string
}

variable "private_subnet_name" {
  type = string
}

variable "public_route_table_cidr_block" {
  type = string
}

variable "public_route_table_name" {
  type = string
}

variable "internet_gateway_name" {
  type = string
}

variable "private_route_table_cidr_block" {
  type = string
}

variable "private_route_table_name" {
  type = string
}

variable "nat_gateway_name" {
  type = string
}

variable "eip_name" {
  type = string
}