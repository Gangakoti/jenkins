resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "vpc"
  }
}
#### creation of igw
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id
   tags = {
    Name = "igw"
  }
}
### creation of subnet
resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ca-central-1a"
  tags = {
    Name = "subnet"
  }
}
### creation of routetable
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
 tags = {
    Name = "rt"
  }
}
#### creation of routetableassociation
resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.rt.id
}