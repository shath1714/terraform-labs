#create public subnet
resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.ffhs-vpc.id
  map_public_ip_on_launch = true
  cidr_block              = "172.31.0.0/20"

  tags = {
    Name = "public_subnet"
  }
}
#Route table
resource "aws_route_table" "route-public" {
  vpc_id = aws_vpc.ffhs-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-route-ffhs"
  }
}

#attach route table to public subent
resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.route-public.id
}
