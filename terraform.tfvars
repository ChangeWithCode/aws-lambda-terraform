aws_region          = "eu-north-1"
function_filename   = "lambda_function.zip"
function_handler    = "lambda_function.lambda_handler"
function_runtime    = "python3.8"
type                = "zip"
output_path         = "lambda_function.zip"
authorization_type  = "NONE"
source_dir          = "/Users/muhammadqasim/Desktop/aws-lambda-practice"
function_name       = "helloWorldLambda"
role_name           = "lambda_exec_role"
alias_name          = "Test_Url"
allow_credentials   = true
allow_origins       = ["*"]
allow_methods       = ["*"]
allow_headers       = ["date", "keep-alive"]
expose_headers      = ["keep-alive", "date"]
max_age             = 86400
policy_name         = "lambda-cloudwatch-logs-policy"
logs_actions        = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents"]
logs_resource       = "*"
assume_role_actions = ["sts:AssumeRole"]
service_principal   = "lambda.amazonaws.com"


