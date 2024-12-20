variable "aws_region" {
  description = "AWS Region"
  default     = "eu-west-1"
}

variable "aws_s3_bucket" {
  description = "AWS Backend Bucket name"
  default     = "state-locking"
}

variable "aws_dynamodb_table" {
  description = "AWS Backend Dynamo Table name"
  default     = "acrobat-state-table"
}
