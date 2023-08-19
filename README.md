# AWS Lambda Configuration :zap:

This Terraform configuration sets up an AWS Lambda function and related resources.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS credentials configured
- Clone this repository to your local machine

# Things covererd :rocket:

- AWS Lambda function
- IAM Role for Lambda execution
- Lambda alias for testing
- Lambda function URLs for both latest and live versions



## Configuration :gear:

1. Update the desired AWS region in the `provider` block in `main.tf`.
2. Replace the `source_dir` in the `data "archive_file"` block with the path to your Lambda function code.
3. Customize the function name, runtime, and handler in the `aws_lambda_function` block.
4. Adjust the CORS settings in the `aws_lambda_function_url` blocks.

## Usage :rocket:

1. Run `terraform init` to initialize the Terraform configuration.
2. Create a `terraform.tfvars` file and add the following content:

   ```hcl
   aws_region    = "eu-north-1"
   source_dir    = "/path/to/your/lambda/function/code"
   function_name = "helloWorldLambda"
   role_name     = "lambda_exec_role"
