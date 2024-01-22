provider "aws" {
    region = "ap-south-1a"  
access_key = "AKIAXFYCGJHJR6GXZI56"
secret_key = "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"
}

resource "aws_instance" "foo" {
  ami           = "ami-0d980397a6e8935cd" 
  instance_type = "t2.micro"
  tags = {
      Name = "TF-Instance"
  }
}
