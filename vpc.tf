provider "aws" {
  access_key = AKIA5QZ56GNWK7G2ZQDX
  secret_key = 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
  region = "ap-south-1"
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
  availability_zone       = "ap-south-1a"  # Change this to an available availability zone in your region
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


# Launch an EC2 instance
resource "aws_instance" "my_instance" {
  ami             = "ami-0d3f444bc76de0a79"  # Replace with the desired AMI ID
  instance_type   = "t2.micro"  # Change this to the desired instance type
  subnet_id       = aws_subnet.my_subnet.id
 

  vpc_security_group_ids = [aws_security_group.instance_sg.id]



 user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              service httpd start
              chkconfig httpd on
              firewall-cmd --zone=public --add-port=80/tcp --permanent
              firewall-cmd --reload
              EOF

  tags = {
    Name = "MyInstance"
  }
}

