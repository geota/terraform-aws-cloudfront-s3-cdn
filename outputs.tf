output "cf_id" {
  value       = var.create_cloudfront_distribution ? aws_cloudfront_distribution.default[0].id : null
  description = "ID of AWS CloudFront distribution"
}

output "cf_arn" {
  value       = var.create_cloudfront_distribution ? aws_cloudfront_distribution.default[0].arn : null
  description = "ID of AWS CloudFront distribution"
}

output "cf_status" {
  value       = var.create_cloudfront_distribution ? aws_cloudfront_distribution.default[0].status : null
  description = "Current status of the distribution"
}

output "cf_domain_name" {
  value       = var.create_cloudfront_distribution ? aws_cloudfront_distribution.default[0].domain_name : null
  description = "Domain name corresponding to the distribution"
}

output "cf_etag" {
  value       = var.create_cloudfront_distribution ? aws_cloudfront_distribution.default[0].etag : null
  description = "Current version of the distribution's information"
}

output "cf_hosted_zone_id" {
  value       = var.create_cloudfront_distribution ? aws_cloudfront_distribution.default[0].hosted_zone_id : null
  description = "CloudFront Route 53 zone ID"
}

output "cf_origin_access_identity" {
  value       = aws_cloudfront_origin_access_identity.default.cloudfront_access_identity_path
  description = "A shortcut to the full path for the origin access identity to use in CloudFront"
}

output "cf_aliases" {
  value       = var.aliases
  description = "Extra CNAMEs of AWS CloudFront"
}

output "s3_bucket" {
  value       = local.bucket
  description = "Name of S3 bucket"
}

output "s3_bucket_domain_name" {
  value       = local.bucket_domain_name
  description = "Domain of S3 bucket"
}
