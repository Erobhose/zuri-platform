terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "zuri_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name    = "zuri-market-vpc"
    Project = "zuri-market"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.zuri_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "zuri-public-subnet"
    Project = "zuri-market"
    Type    = "public"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.zuri_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name    = "zuri-private-subnet"
    Project = "zuri-market"
    Type    = "private"
  }
}

resource "aws_internet_gateway" "zuri_igw" {
  vpc_id = aws_vpc.zuri_vpc.id

  tags = {
    Name    = "zuri-market-igw"
    Project = "zuri-market"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.zuri_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.zuri_igw.id
  }

  tags = {
    Name    = "zuri-public-route-table"
    Project = "zuri-market"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}