resource "aws_vpc" "myvpc" {
    cidr_block = var.cidr_vpc
    tags = {
        name = "myvpc"
    }  
}

resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "my-igw"
  }
}

# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}

resource "aws_subnet" "PublicSub1" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.cidr_pubsub1
    availability_zone = data.aws_availability_zones.available_zones.names[0]
    map_public_ip_on_launch = true

    tags = {
     Name = "PublicSub1-a"
  }
}

resource "aws_subnet" "PublicSub2" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.cidr_pubsub2
    availability_zone = data.aws_availability_zones.available_zones.names[1]
    map_public_ip_on_launch = true

    tags = {
     Name = "PublicSub2-b"
  }
}

resource "aws_route_table" "myRT" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }

  tags = {
    Name = "myRT"
  }
}

resource "aws_route_table_association" "Publicsub1-subnet-association" {
    subnet_id = aws_subnet.PublicSub1.id
    route_table_id = aws_route_table.myRT.id
}

resource "aws_route_table_association" "PublicSub2-subnet-association" {
    subnet_id = aws_subnet.PublicSub2.id
    route_table_id = aws_route_table.myRT.id
}
