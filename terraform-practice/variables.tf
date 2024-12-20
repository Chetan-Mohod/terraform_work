variable "aws_region" {
  description = "This is the region specified for AWS Resources"
  default     = "eu-west-1"
}

variable "aws_ec2_ami_id" {
  description = "This is AMI ID for Ubuntu Instance"
  default     = "ami-0e9085e60087ce171"
}

variable "ec2_instance_type" {
  description = "This is the Instance type for EC2"
  default     = "t2.micro"
}

variable "aws_ec2_instance_name" {
  description = "This is the name given to EC2 instance"
  default     = "Auto-Server"
}

variable "aws_root_volume_size" {
  description = "This is the size of root volume for aws EC2"
  default     = 8
}


variable "aws_instance_count" {
  description = "The count of EC2 instance needed"
  default     = 2
}

locals {
  instances = {
    #Key   : #Value
    "key"  : "my_instance_1"
    "key2" : "my_instacne_2"
  }
}
