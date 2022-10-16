terraform {
  backend "s3" {
    bucket = "luizok-terraform-deploy"
    key    = "tf_lambda.tfstate"
    region = "sa-east-1"
  }
}

data "archive_file" "init" {
  type        = "zip"
  source_dir  = "../app"
  output_path = "../out/code.zip"
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "tf_${var.project_name}_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "tf_test_lambda" {

  filename      = data.archive_file.init.output_path
  function_name = "tf_${var.project_name}"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "main.lambda_handler"

  source_code_hash = filebase64sha256(data.archive_file.init.output_path)

  runtime = "python3.9"

  timeout = 2 # Secs

  ephemeral_storage {
    size = 512 # MB
  }
}