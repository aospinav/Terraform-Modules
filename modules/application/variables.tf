variable "name_lt" {
  description = "Name of the lauch template"
  type = string
  default = "launch-template"
}

variable "type_instance" {
  description = "Type of instance"
  type = string
    default = "t3.micro"

}

variable "sg_instance_id" {
  description = "list of security groups"
  type = list(string)
    default = []
}

variable "name_asg" {
    description = "Name of auto scaling"
    type = string
    default = "auto-scaling-group"
  
}

variable "public_subnetA_id" {
    description = "ID of public subnet A"
    type = string
  
}

variable "public_subnetB_id" {
    description = "ID of public subnet B"
    type = string
  
}
variable "public_subnetC_id" {
    description = "ID of public subnet C"
    type = string
  
}

variable "name_load_balancer" {
    description = "Name of load balancer"
    type = string
    default = "web-load-balancer"
  
}

variable "sg_lb_id" {
  description = "Security group id lg"
    type = list(string )

}

variable "vpc_id" {
    description = "VPC ID"
        type = string
}