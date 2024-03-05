# Create VPC
resource "aws_vpc" "hrhouz-vpc" {
  cidr_block = var.vpc-cidr
}

# Create a subnet within the VPC
resource "aws_subnet" "hrhouz-subnet" {
  vpc_id     = aws_vpc.hrhouz-vpc.id
  cidr_block = var.sub-cidr
}

# Create internet gateway for public access
resource "aws_internet_gateway" "hrhouz-igw" {
  vpc_id = aws_vpc.hrhouz-vpc.id
}

# Create a route table for public subnet
resource "aws_route_table" "hrhouz-rt" {
  vpc_id = aws_vpc.hrhouz-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hrhouz-igw.id
  }
}

# Associate the route table with the subnet
resource "aws_route_table_association" "hrhouz_subnet_association" {
  subnet_id      = aws_subnet.hrhouz-subnet.id
  route_table_id = aws_route_table.hrhouz-rt.id
}


