resource "aws_lambda_function" "hello_rati_function" {
  function_name = "rati-lambda-function"
  s3_bucket = aws_s3_bucket.rati-s3-bucket.id
  s3_key = aws_s3_object.lambda_hello.key

  runtime = "nodejs16.x"
  handler = "function.handler"

  source_code_hash = data.archive_file.lambda_hello.output_base64sha256

  role = aws_iam_role.lambda_exec_rati.arn
}

resource "aws_cloudwatch_log_group" "rati-logs" {
  name = "/aws/lambda/${aws_lambda_function.hello_rati_function.function_name}"
  retention_in_days = 14
}

data "archive_file" "lambda_hello" {
  type = "zip"
  source_file = "./function.js"
  output_path = "output-zip/function.zip"
}


resource "aws_s3_object" "lambda_hello" {
  bucket = aws_s3_bucket.rati-s3-bucket.id
  key = "function.zip"
  source = data.archive_file.lambda_hello.output_path
  etag = filemd5(data.archive_file.lambda_hello.output_path)
}
