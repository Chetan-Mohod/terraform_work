# output "ec2_public_ip" {
#   value = aws_instance.my_instance[*].public_ip
# }


# output "ec2_private_ip" {
#   value = aws_instance.my_instance[*].private_ip
# }

#--------------------------------------------------------------------
# output "ec2_public_ip" {
#   value = [
#     for instance in aws_instance.my_instance : instance.public_ip
#   ]
# }

# You can use above code or below code

output "ec2_public_ip" {
  value = {
    for key, instance in aws_instance.my_instance : key => instance.public_ip
  }
}

#--------------------------------------------------------------------

