provider "aws" {
  access_key = "AKIA5QZ56GNWK7G2ZQDX"
  secret_key = "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"
  region = "us-east-2"
}

# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
}

# Create an Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
}

# Create a subnet within the VPC
resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-2"  # Change this to an available availability zone in your region
  map_public_ip_on_launch = true

}
# Create a security group for the instance
resource "aws_security_group" "instance_sg" {
  vpc_id = aws_vpc.my_vpc.id
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  ami           = "ami-09694bfab577e90b0"  # Amazon Linux 2 AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
  }
}


