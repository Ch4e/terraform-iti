# Public Route Table
resource "aws_route_table" "publicRouteTable" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "publicRouteTable"
  }
}

resource "aws_route" "routePublicRouteTable" {
  route_table_id = aws_route_table.publicRouteTable.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "RouteTableAssociation1" {
  subnet_id = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.publicRouteTable.id
}

resource "aws_route_table_association" "RouteTableAssociation2" {
  subnet_id = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.publicRouteTable.id
}

# Private Route Table

resource "aws_route_table" "privateRouteTable" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "privateRouteTable"
  }
}

resource "aws_route" "routePrivateRouteTable" {
  route_table_id = aws_route_table.privateRouteTable.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.natGateway.id
}

resource "aws_route_table_association" "RouteTableAssociationPrivate1" {
  subnet_id = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.privateRouteTable.id
}

resource "aws_route_table_association" "RouteTableAssociationPrivate2" {
  subnet_id = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.privateRouteTable.id
}