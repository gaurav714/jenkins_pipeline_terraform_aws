terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

# Create the first EC2 instance
resource "aws_instance" "first_instance" {
  ami           = "ami-0a4408457f9a03be3" # Amazon Linux 2 AMI (replace with your desired AMI)
  instance_type = "t2.micro"

  tags = {
    Name = "first-micro-instance"
  }
}

# Create the second EC2 instance
resource "aws_instance" "second_instance" {
  ami           = "ami-0a4408457f9a03be3" # Amazon Linux 2 AMI (replace with your desired AMI)
  instance_type = "t2.micro"

  tags = {
    Name = "second-micro-instance"
  }
}
