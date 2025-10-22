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


#-----network security variables-----#
variable "name_sg_ssh" {
  description = "Name of the security group for SSH access"
  type        = string
  default     = "sg-ssh-access"
}

variable "name_sg_http" {
  description = "Name of the security group for HTTP access"
  type        = string
  default     = "sg-http-access"
}

variable "name_sg_private_http" {
  description = "Name of the security group for private HTTP access"
  type        = string
  default     = "sg-http-private-access"
}


variable "allowed_ip_range" {
  description = "CIDR block allowed to access SSH"
  type        = string
  default     = "0.0.0.0/0"
}

variable "custom_ip" {
  description = "Custom IP address for specific rules"
  type        = string
  default     = "181.53.45.165/32"

}

#-----application variables---------------------

variable "name_lt" {
  description = "Name of the lauch template"
  type        = string
  default     = "launch-template"
}

variable "type_instance" {
  description = "Type of instance"
  type        = string
  default     = "t3.micro"

}

variable "name_asg" {
  description = "Name of auto scaling"
  type        = string
  default     = "auto-scaling-group"

}

variable "name_load_balancer" {
  description = "Name of load balancer"
  type        = string
  default     = "web-load-balancer"

}
