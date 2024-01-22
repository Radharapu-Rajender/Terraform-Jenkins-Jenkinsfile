resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "demo-vpc"
    Purpose = "Jenkins Demo"
  }
}

resource "aws_instance" "example_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # Change this to your desired AMI ID
  instance_type = "t2.micro"
 

  tags = {
    Name = "ExampleInstance"
  }
}
