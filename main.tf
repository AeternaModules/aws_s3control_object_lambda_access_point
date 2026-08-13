resource "aws_s3control_object_lambda_access_point" "s3control_object_lambda_access_points" {
  for_each = var.s3control_object_lambda_access_points

  name       = each.value.name
  account_id = each.value.account_id
  region     = each.value.region

  configuration {
    allowed_features            = each.value.configuration.allowed_features
    cloud_watch_metrics_enabled = each.value.configuration.cloud_watch_metrics_enabled
    supporting_access_point     = each.value.configuration.supporting_access_point
    dynamic "transformation_configuration" {
      for_each = each.value.configuration.transformation_configuration
      content {
        actions = transformation_configuration.value.actions
        content_transformation {
          aws_lambda {
            function_arn     = transformation_configuration.value.content_transformation.aws_lambda.function_arn
            function_payload = transformation_configuration.value.content_transformation.aws_lambda.function_payload
          }
        }
      }
    }
  }
}

