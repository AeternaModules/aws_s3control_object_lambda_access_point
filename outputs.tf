output "s3control_object_lambda_access_points_id" {
  description = "Map of id values across all s3control_object_lambda_access_points, keyed the same as var.s3control_object_lambda_access_points"
  value       = { for k, v in aws_s3control_object_lambda_access_point.s3control_object_lambda_access_points : k => v.id if v.id != null && length(v.id) > 0 }
}
output "s3control_object_lambda_access_points_account_id" {
  description = "Map of account_id values across all s3control_object_lambda_access_points, keyed the same as var.s3control_object_lambda_access_points"
  value       = { for k, v in aws_s3control_object_lambda_access_point.s3control_object_lambda_access_points : k => v.account_id if v.account_id != null && length(v.account_id) > 0 }
}
output "s3control_object_lambda_access_points_alias" {
  description = "Map of alias values across all s3control_object_lambda_access_points, keyed the same as var.s3control_object_lambda_access_points"
  value       = { for k, v in aws_s3control_object_lambda_access_point.s3control_object_lambda_access_points : k => v.alias if v.alias != null && length(v.alias) > 0 }
}
output "s3control_object_lambda_access_points_arn" {
  description = "Map of arn values across all s3control_object_lambda_access_points, keyed the same as var.s3control_object_lambda_access_points"
  value       = { for k, v in aws_s3control_object_lambda_access_point.s3control_object_lambda_access_points : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "s3control_object_lambda_access_points_configuration" {
  description = "Map of configuration values across all s3control_object_lambda_access_points, keyed the same as var.s3control_object_lambda_access_points"
  value       = { for k, v in aws_s3control_object_lambda_access_point.s3control_object_lambda_access_points : k => v.configuration if v.configuration != null && length(v.configuration) > 0 }
}
output "s3control_object_lambda_access_points_name" {
  description = "Map of name values across all s3control_object_lambda_access_points, keyed the same as var.s3control_object_lambda_access_points"
  value       = { for k, v in aws_s3control_object_lambda_access_point.s3control_object_lambda_access_points : k => v.name if v.name != null && length(v.name) > 0 }
}
output "s3control_object_lambda_access_points_region" {
  description = "Map of region values across all s3control_object_lambda_access_points, keyed the same as var.s3control_object_lambda_access_points"
  value       = { for k, v in aws_s3control_object_lambda_access_point.s3control_object_lambda_access_points : k => v.region if v.region != null && length(v.region) > 0 }
}

