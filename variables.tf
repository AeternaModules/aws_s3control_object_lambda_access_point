variable "s3control_object_lambda_access_points" {
  description = <<EOT
Map of s3control_object_lambda_access_points, attributes below
Required:
    - name
    - configuration (block):
        - allowed_features (optional)
        - cloud_watch_metrics_enabled (optional)
        - supporting_access_point (required)
        - transformation_configuration (required, block):
            - actions (required)
            - content_transformation (required, block):
                - aws_lambda (required, block):
                    - function_arn (required)
                    - function_payload (optional)
Optional:
    - account_id
    - region
EOT

  type = map(object({
    name       = string
    account_id = optional(string)
    region     = optional(string)
    configuration = object({
      allowed_features            = optional(set(string))
      cloud_watch_metrics_enabled = optional(bool)
      supporting_access_point     = string
      transformation_configuration = list(object({
        actions = set(string)
        content_transformation = object({
          aws_lambda = object({
            function_arn     = string
            function_payload = optional(string)
          })
        })
      }))
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.s3control_object_lambda_access_points : (
        length(v.configuration.transformation_configuration) >= 1
      )
    ])
    error_message = "Each transformation_configuration list must contain at least 1 items"
  }
  # Note: 5 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

