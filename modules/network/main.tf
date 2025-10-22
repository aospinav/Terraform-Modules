resource "aws_vpc" "this" {
    cidr_block = var.vpc_cidr
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = var.name_vpc
}

resource "aws_subnet" "this" {
    for_each = var.setup_subnets
    vpc_id = aws_vpc.this.id
    cidr_block = each.value.cidr
    availability_zone = each.value.az
    map_public_ip_on_launch = true

    tags = {
        Name = each.value.name
    } 

}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.this.id
    tags = {
        Name = var.name_igw
    }
}

resource "aws_route_table" "name" {
    vpc_id = aws_vpc.this.id
    tags = {
        Name = var.name_rt
    }
  
}

resource "aws_route" "default_route" {
    route_table_id = aws_route_table.name.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
    depends_on = [aws_internet_gateway.igw]

}

resource "aws_route_table_association" "rta" {
    for_each = aws_subnet.this
    subnet_id = each.value.id
    route_table_id = aws_route_table.name.id
  
}

