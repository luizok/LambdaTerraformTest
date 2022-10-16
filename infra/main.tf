data "archive_file" "init" {
  type        = "zip"
  source_dir  = "../app"
  output_path = "../out/code.zip"
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "tf_lambda_role"

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
