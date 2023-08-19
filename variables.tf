variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
}

variable "type" {
  description = "type of source directory containing Lambda function code."
  type        = string
}

variable "source_dir" {
  description = "Path to the source directory containing Lambda function code."
  type        = string
}

variable "output_path" {
  description = "Output of source directory containing Lambda function code."
  type        = string
}


variable "function_filename" {
  description = "Name of the Lambda function code ZIP file."
  type        = string
}

variable "function_handler" {
  description = "Handler for the Lambda function."
  type        = string
}

variable "function_runtime" {
  description = "Runtime for the Lambda function."
  type        = string
}



variable "function_name" {
  description = "Name of the Lambda function."
  type        = string
}


variable "alias_name" {
  description = "Name of the Lambda alias."
  type        = string
}

variable "authorization_type" {
  description = "Authorization type of the Lambda."
  type        = string
}

variable "allow_credentials" {
  description = "Allow credentials for CORS."
  type        = bool
}

variable "allow_origins" {
  description = "List of allowed CORS origins."
  type        = list(string)
}

variable "allow_methods" {
  description = "List of allowed CORS methods."
  type        = list(string)
}

variable "allow_headers" {
  description = "List of allowed CORS headers."
  type        = list(string)
}

variable "expose_headers" {
  description = "List of CORS headers to expose."
  type        = list(string)
}

variable "max_age" {
  description = "Maximum age for CORS preflight requests (in seconds)."
  type        = number
}


variable "policy_name" {
  description = "Name of the IAM policy."
  type        = string
}

variable "logs_actions" {
  description = "List of allowed CloudWatch Logs actions."
  type        = list(string)
}

variable "logs_resource" {
  description = "Resource for CloudWatch Logs permissions."
  type        = string
}

variable "role_name" {
  description = "Name of the IAM role for the Lambda function."
  type        = string
}

variable "assume_role_actions" {
  description = "List of allowed AssumeRole actions."
  type        = list(string)
}

variable "service_principal" {
  description = "Service principal for the AssumeRole policy."
  type        = string
}


