resource "aws_vpc" "adish-mern_vpc" {
  cidr_block           = var.adis-vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = { Name = "adish-mern-vpc" }
}

//internet Gateway
resource "aws_internet_gateway" "adish-igw" {
  vpc_id = aws_vpc.adish-mern_vpc.id
}

//Sebnets
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.adish-mern_vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.adish-mern_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = false
}

//Net Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id
  depends_on = [aws_internet_gateway.adish-igw]
}

// Route Tables
resource "aws_route_table" "adish-public-rt" {
  vpc_id = aws_vpc.adish-mern_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.adish-igw.id
  }
}

resource "aws_route_table" "adish-private-rt" {
  vpc_id = aws_vpc.adish-mern_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
}

// Route Table Associations
resource "aws_route_table_association" "public_subnet_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.adish-public-rt.id
}

resource "aws_route_table_association" "private_subnet_assoc" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.adish-private-rt.id
}

