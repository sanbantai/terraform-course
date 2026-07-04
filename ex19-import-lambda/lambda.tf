import {
  to = aws_lambda_function.this
  id = "ManuallyCreatedLambda"
}

data "archive_file" "init" {
  type        = "zip"
  source_file = "${path.root}/build/index.mjs"
  output_path = "${path.root}/lambda.zip"
}

resource "aws_lambda_function" "this" {
  description        = "A starter AWS Lambda function."
  filename           = data.archive_file.init.output_path
  source_code_hash = data.archive_file.init.output_base64sha256
  function_name      = "ManuallyCreatedLambda"
  handler            = "index.handler"
  role               = aws_iam_role.lambda_execution_role.arn
  runtime            = "nodejs22.x"
  source_kms_key_arn = null

  logging_config {
    log_format = "Text"
    log_group  = "/aws/lambda/ManuallyCreatedLambda"
  }
}

resource "aws_lambda_function_url" "this" {
  function_name      = aws_lambda_function.this.function_name
  authorization_type = "NONE"
}