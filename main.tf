provider "aws" {
  region = "eu-north-1"  # Change this to your desired region
}

data "archive_file" "lambda_function_zip" {
  type        = "zip"
  source_dir  = "/Users/muhammadqasim/Desktop/aws-lambda-practice"  # Path to the cloned repository directory
  output_path = "lambda_function.zip"
}

resource "aws_lambda_function" "hello_world_lambda" {
  filename         = "lambda_function.zip"
  function_name    = "helloWorldLambda"
  role             = aws_iam_role.lambda_exec.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.8"

  source_code_hash = data.archive_file.lambda_function_zip.output_base64sha256
}

resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_lambda_alias" "test_alias" {
  name             = "test"
  function_name    = aws_lambda_function.hello_world_lambda.function_name
  function_version = aws_lambda_function.hello_world_lambda.version
}

resource "aws_lambda_function_url" "test_latest" {
  function_name      = aws_lambda_function.hello_world_lambda.function_name
  authorization_type = "NONE"
}

resource "aws_lambda_function_url" "test_live" {
  function_name      = aws_lambda_function.hello_world_lambda.function_name
  qualifier          = aws_lambda_alias.test_alias.name
  authorization_type = "NONE"

  cors {
    allow_credentials = true
    allow_origins     = ["*"]
    allow_methods     = ["*"]
    allow_headers     = ["date", "keep-alive"]
    expose_headers    = ["keep-alive", "date"]
    max_age           = 86400
  }
}
