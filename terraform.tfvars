vpc_cidr = "10.10.0.0/16"
name_vpc = {
  Name = "cmtr-r6p03wfj-vpc"
}
name_igw = "cmtr-r6p03wfj-igw"
name_rt  = "cmtr-r6p03wfj-rt"
setup_subnets = {
  "public-a" = { "name" = "cmtr-r6p03wfj-subnet-public-a", "cidr" = "10.10.1.0/24", "az" = "us-east-1a" }
  "public-b" = { "name" = "cmtr-r6p03wfj-subnet-public-b", "cidr" = "10.10.3.0/24", "az" = "us-east-1b" }
  "public-c" = { "name" = "cmtr-r6p03wfj-subnet-public-c", "cidr" = "10.10.5.0/24", "az" = "us-east-1c" }
}



name_sg_ssh          = "cmtr-r6p03wfj-ssh-sg"
name_sg_http         = "cmtr-r6p03wfj-public-http-sg"
name_sg_private_http = "cmtr-r6p03wfj-private-http-sg"
allowed_ip_range     = "0.0.0.0/0" #"18.153.146.156/32"
custom_ip            = "152.201.45.61/32"


name_lt            = "cmtr-r6p03wfj-template"
type_instance      = "t3.micro"
name_asg           = "cmtr-r6p03wfj-asg"
name_load_balancer = "cmtr-r6p03wfj-lb"
