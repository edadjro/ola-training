resource "aws_vpc" "ola" {
  cidr_block = var.vpccidr
  instance_tenancy = "default"
  tags = {
    Name = "ola_vpc"
  }

}

resource "aws_internet_gateway" "ola_igw" {
  vpc_id = aws_vpc.ola_vpc.id
  tags = {
    Name = "ola_igw"
  }

}
resource "aws_vpn_gateway_attachment" "ola_igw_attachment" {
  vpc_id = aws_vpc.ola_vpc.id
  internet_gateway_id = aws_internet_gateway.ola_igw.id

}

resource "aws_subnet" "ola_subnet" {
  vpc_id = aws_vpc.ola_vpc.id
  cidr_block = var.subcidr
  tags = {
    Name = "ola_subnet"
  }

}
resource "aws_route_table" "olaRT" {
  vpc_id = aws_vpc.ola_vpc.id

  route {
    cidr_block = var.subcidr
    gateway_id = aws_internet_gateway.ola.igw.id
  }
  tags = {
     Name = "olaRT"
  }
}

resource "aws_route_table_association" "olaRTasso" {
  subnet_id      = aws_subnet.ola_subnet.id
  route_table_id = aws_route_table.olaRT.id
}

resource "aws_security_group" "olaSG" {
  name        = "olaSG"
  description = "Allow olaSG inbound traffic"
  vpc_id      = aws_vpc.ola_vpc.id

  ingress {
    description      = "ola_ingress_rules"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "ola_ingress_rules"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "ola_ingress_rules"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "olaSG"
  }
}
