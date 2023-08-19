variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
}

variable "source_dir" {
  description = "Path to the source directory containing Lambda function code."
  type        = string
}

variable "function_name" {
  description = "Name of the Lambda function."
  type        = string
}

variable "role_name" {
  description = "Name of the IAM role for the Lambda function."
  type        = string
}
