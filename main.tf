provider "aws" {
  region = var.aws_region
}

data "archive_file" "lambda_function_zip" {
  type        = var.type
  source_dir  = var.source_dir
  output_path = var.output_path
}

resource "aws_lambda_function" "hello_world_lambda" {
  filename      = var.function_filename
  function_name = var.function_name
  role          = aws_iam_role.lambda_exec.arn
  handler       = var.function_handler
  runtime       = var.function_runtime

  source_code_hash = data.archive_file.lambda_function_zip.output_base64sha256
}

resource "aws_iam_role" "lambda_exec" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = var.assume_role_actions,
      Effect = "Allow",
      Principal = {
        Service = var.service_principal
      }
    }]
  })
}

resource "aws_iam_policy" "cloudwatch_logs_policy" {
  name = var.policy_name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = var.logs_actions,
        Effect   = "Allow",
        Resource = var.logs_resource
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "cloudwatch_logs_attachment" {
  policy_arn = aws_iam_policy.cloudwatch_logs_policy.arn
  role       = aws_iam_role.lambda_exec.name
}

resource "aws_lambda_alias" "test_alias" {
  name             = var.alias_name
  function_name    = aws_lambda_function.hello_world_lambda.function_name
  function_version = aws_lambda_function.hello_world_lambda.version
}

resource "aws_lambda_function_url" "test_latest" {
  function_name      = aws_lambda_function.hello_world_lambda.function_name
  authorization_type = var.authorization_type
}

resource "aws_lambda_function_url" "test_live" {
  function_name      = aws_lambda_function.hello_world_lambda.function_name
  qualifier          = aws_lambda_alias.test_alias.name
  authorization_type = var.authorization_type

  cors {
    allow_credentials = var.allow_credentials
    allow_origins     = var.allow_origins
    allow_methods     = var.allow_methods
    allow_headers     = var.allow_headers
    expose_headers    = var.expose_headers
    max_age           = var.max_age
  }
}
