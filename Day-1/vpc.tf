resource "aws_vpc" "main" {
  cidr_block         = var.cidr_block
  enable_dns_support = false

  tags = {
    Name = "Dev"
  }

}

resource "aws_subnet" "public_1" {
  cidr_block        = var.subnet_public_1
  vpc_id            = aws_vpc.main.id
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public-1"
  }
}

resource "aws_subnet" "public_2" {
  cidr_block        = var.subnet_public_2
  vpc_id            = aws_vpc.main.id
  availability_zone = "us-east-1b"

  tags = {
    Name = "Public-2"
  }
}

resource "aws_subnet" "private_1" {
  cidr_block        = var.subnet_private_1
  vpc_id            = aws_vpc.main.id
  availability_zone = "us-east-1a"

  tags = {
    Name = "Private-1"
  }
}

resource "aws_subnet" "private_2" {
  cidr_block        = var.subnet_private_2
  vpc_id            = aws_vpc.main.id
  availability_zone = "us-east-1b"

  tags = {
    Name = "Private-2"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "IG-main"
  }

}

resource "aws_eip" "nat1" {
  vpc = true

  tags = {
    Name = "nat1"
  }

}

resource "aws_eip" "nat2" {
  vpc = true

  tags = {
    Name = "nat2"
  }

}

resource "aws_nat_gateway" "main1" {
  allocation_id = aws_eip.nat1.id
  subnet_id     = aws_subnet.public_1.id

  tags = {
    Name = "main1"
  }
}

resource "aws_nat_gateway" "main2" {
  allocation_id = aws_eip.nat2.id
  subnet_id     = aws_subnet.public_2.id

  tags = {
    Name = "main2"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id

  }

  tags = {
    Name = "public"
  }

}

resource "aws_route_table" "private1" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main1.id

  }

  tags = {
    Name = "private1"
  }
}

resource "aws_route_table" "private2" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main2.id

  }

  tags = {
    Name = "private2"
  }
}

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private1.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private2.id
}



