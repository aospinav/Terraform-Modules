variable "vpc_cidr" {
  description = "value"
  type        = string
  default     = "10.0.0.0/16"
}

variable "name_vpc" {
  description = "Tags for the VPC"
  type        = map(string)
  default = {
    Name = "my-vpc"
  }
}

variable "name_igw" {
  description = "Name of the internet gateway"
  type        = string
  default     = "my-igw"

}

variable "name_rt" {
  description = "Name of the route table"
  type        = string
  default     = "my-route-table"

}

variable "setup_subnets" {
  description = "atributes of the 3 subnets"
  type        = map(map(string))
  default = {
    "public-a" = { "name" = "subnet_A", "cidr" = "10.0.1.0/24", "az" = "us-east-1a" }
    "public-b" = { "name" = "subnet_B", "cidr" = "10.0.2.0/24", "az" = "us-east-1b" }
    "public-c" = { "name" = "subnet_C", "cidr" = "10.0.3.0/24", "az" = "us-east-1c" }

  }


}