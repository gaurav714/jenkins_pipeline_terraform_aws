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
  ami           = "ami-0a4408457f9a03be3" # Amazon Linux 2 AMI for the asiap-south-1 region
  instance_type = "t2.micro"

  tags = {
    Name = "first-micro-instance"
  }
}
# Output the instance details
output "instance_public_ip" {
  value       = aws_instance.first_instance.public_ip
  description = "The public IP of the EC2 instance"
}

output "instance_private_ip" {
  value       = aws_instance.first_instance.private_ip
  description = "The private IP of the EC2 instance"
}

output "instance_id" {
  value       = aws_instance.first_instance.id
  description = "The ID of the EC2 instance"
}