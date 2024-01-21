provider "aws" {
region = "ap-south-1"
access_key = "AKIAXFYCGJHJXPNWYEFF"
secret_key = "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"
}
resource "aws_instance" "foo" {
  ami = "ami-0d980397a6e8935cd"
  instance_type = "t2.micro"
  tags = {
      Name = "bhupesh-Instance"
  }
}

