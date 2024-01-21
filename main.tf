provider "aws" {
region = "ap-south-1"
access_key = "AKIAXFYCGJHJ6ATHWZ6G"
secret_key = "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"

}
resource "aws_instance" "foo" {
  ami = "ami-0d980397a6e8935cd"
  instance_type = "t2.micro"
  tags = {
      Name = "bhupesh-Instance"
  }
}

