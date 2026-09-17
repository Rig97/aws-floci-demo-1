
output "bucket_name" {
  value = aws_s3_bucket.my_first_bucket.bucket
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.my_first_table.name
}

output "lambda_function_name" {
  value = aws_lambda_function.my_first_lambda.function_name
}

output "lambda_role_arn" {
  value = aws_iam_role.lambda_role.arn
}
