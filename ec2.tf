provider "aws" {
  region = "ap-south-1" # Change this to your desired AWS region
}

resource "aws_instance" "example_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # Change this to your desired AMI ID
  instance_type = "t2.micro"
 

  tags = {
    Name = "ExampleInstance"
  }
}

provider "aws" {
  region = "ap-south-1" # Change this to your desired AWS region
}

resource "aws_instance" "example_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # Change this to your desired AMI ID
  instance_type = "t2.micro"
 

  tags = {
    Name = "ExampleInstance"
  }
}
