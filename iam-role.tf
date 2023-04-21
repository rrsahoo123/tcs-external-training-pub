resource "aws_iam_role" "lambda_exec_rati" {
  name = "hello-lambda-rati"

  assume_role_policy = <<POLICY
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": {
                    "Service": "lambda.amazonaws.com"
                },
                "Action": "sts:AssumeRole"
            }
        ] 
    }
    POLICY
}

resource "aws_iam_role_policy_attachment" "lambda_exec_rati" {
  role = aws_iam_role.lambda_exec_rati.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}