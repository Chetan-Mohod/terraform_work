data "aws_ami" "os_image" {
 owners = ["099720109477"]
  most_recent = true
  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/*amd64*"]
  }
}

resource "aws_key_pair" "my-key" {
  key_name   = "acrobat-terraform-key"
  public_key = file("acrobat-terraform-key.pub")
}

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "my_sg" {
  name        = "Z plus security"
  description = "This is a security grp created by Terraform"
  vpc_id      = aws_default_vpc.default.id #This is called interpolatiion
  ingress {                                #Inbound Rule
    description = "Allow access to SSH port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #Anywhere around the IP access grant
  }
  ingress { #Inbound Rule
    description = "Allow access to SSH port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress { #Outbound Rule
    description = "allow all outgoing traffice"
    to_port     = 0
    from_port   = 0
    protocol    = "-1" #Why -1? Outgoing traffic to everytype HTTP, HTTPS, TCP, etc
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Z plus security"
  }
}

resource "aws_instance" "my_instance" {
  #count           = var.aws_instance_count  #Meta Argument
  for_each        = local.instances          #Meta Argument
  ami             = data.aws_ami.os_image.id
  instance_type   = var.ec2_instance_type
  security_groups = [aws_security_group.my_sg.name] #Interpolation
  key_name        = aws_key_pair.my-key.key_name    #Interpolation
  root_block_device {
    volume_size = var.aws_root_volume_size
    volume_type = "gp3"
  }
  tags = {
    Name = each.value
  }
}
