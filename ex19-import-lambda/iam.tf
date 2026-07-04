import {
  to = aws_iam_role.lambda_execution_role
  id = "ManuallyCreatedLambda-role-s81if7by"
}

import {
  to = aws_iam_policy.lambda_execution
  id = "arn:aws:iam::998461587073:policy/service-role/AWSLambdaBasicExecutionRole-b07b835a-2547-4b71-8506-efb3467655f8"
}

data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "lambda_execution_policy" {
  statement {
    actions   = ["logs:CreateLogGroup"]
    effect    = "Allow"
    resources = ["arn:aws:logs:${data.aws_region.current.region}:${data.aws_caller_identity.current.account_id}:*"]
  }

  statement {
    actions   = ["logs:CreateLogStream", "logs:PutLogEvents"]
    effect    = "Allow"
    resources = ["arn:aws:logs:${data.aws_region.current.region}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/ManuallyCreatedLambda:*"]
  }
}

resource "aws_iam_role" "lambda_execution_role" {
  name               = "ManuallyCreatedLambda-role-s81if7by"
  path               = "/service-role/"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
}

resource "aws_iam_policy" "lambda_execution" {
  name   = "AWSLambdaBasicExecutionRole-b07b835a-2547-4b71-8506-efb3467655f8"
  path   = "/service-role/"
  policy = data.aws_iam_policy_document.lambda_execution_policy.json
}

resource "aws_iam_role_policy_attachment" "lambda_execution" {
  role       = aws_iam_role.lambda_execution_role.name
  policy_arn = aws_iam_policy.lambda_execution.arn
}