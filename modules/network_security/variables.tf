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

variable "vpc_id" {
  description = "The ID of the VPC where security groups will be created"
  type        = string
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