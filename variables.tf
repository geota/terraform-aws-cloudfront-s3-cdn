variable "namespace" {
  description = "Namespace (e.g. `eg` or `cp`)"
  type        = string
  default     = ""
}

variable "stage" {
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  type        = string
  default     = ""
}

variable "name" {
  description = "Name  (e.g. `bastion` or `app`)"
  type        = string
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `namespace`, `stage`, `name` and `attributes`"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)"
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Select Enabled if you want CloudFront to begin processing requests as soon as the distribution is created, or select Disabled if you do not want CloudFront to begin processing requests after the distribution is created."
}

variable "acm_certificate_arn" {
  type        = string
  description = "Existing ACM Certificate ARN"
  default     = ""
}

variable "minimum_protocol_version" {
  type        = string
  description = "Cloudfront TLS minimum protocol version"
  default     = "TLSv1"
}

variable "aliases" {
  type        = list(string)
  description = "List of FQDN's - Used to set the Alternate Domain Names (CNAMEs) setting on Cloudfront"
  default     = []
}

variable "use_regional_s3_endpoint" {
  type        = bool
  description = "When set to 'true' the s3 origin_bucket will use the regional endpoint address instead of the global endpoint address unless a website_config is provided. If a website_config is set, it will use the s3 website endpoint."
  default     = false
}

variable "origin_bucket" {
  type        = string
  default     = ""
  description = "Origin S3 bucket name"
}

variable "origin_path" {
  # http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValuesOriginPath
  type        = string
  description = "An optional element that causes CloudFront to request your content from a directory in your Amazon S3 bucket or your custom origin. It must begin with a /. Do not add a / at the end of the path."
  default     = ""
}

variable "origin_force_destroy" {
  type        = bool
  default     = false
  description = "Delete all objects from the bucket  so that the bucket can be destroyed without error (e.g. `true` or `false`)"
}

variable "bucket_domain_format" {
  type        = string
  default     = "%s.s3.amazonaws.com"
  description = "Format of bucket domain name"
}

variable "compress" {
  type        = bool
  default     = false
  description = "Compress content for web requests that include Accept-Encoding: gzip in the request header"
}

variable "is_ipv6_enabled" {
  type        = bool
  default     = true
  description = "State of CloudFront IPv6"
}

variable "default_root_object" {
  type        = string
  default     = "index.html"
  description = "Object that CloudFront return when requests the root URL"
}

variable "comment" {
  type        = string
  default     = "Managed by Terraform"
  description = "Comment for the origin access identity"
}

variable "log_include_cookies" {
  type        = bool
  default     = false
  description = "Include cookies in access logs"
}

variable "log_prefix" {
  type        = string
  default     = ""
  description = "Path of logs in S3 bucket"
}

variable "log_standard_transition_days" {
  description = "Number of days to persist in the standard storage tier before moving to the glacier tier"
  default     = 30
}

variable "log_glacier_transition_days" {
  description = "Number of days after which to move the data to the glacier storage tier"
  default     = 60
}

variable "log_expiration_days" {
  description = "Number of days after which to expunge the objects"
  default     = 90
}

variable "forward_query_string" {
  type        = bool
  default     = false
  description = "Forward query strings to the origin that is associated with this cache behavior"
}

variable "cors_allowed_headers" {
  type        = list(string)
  default     = ["*"]
  description = "List of allowed headers for S3 bucket"
}

variable "cors_allowed_methods" {
  type        = list(string)
  default     = ["GET"]
  description = "List of allowed methods (e.g. GET, PUT, POST, DELETE, HEAD) for S3 bucket"
}

variable "cors_allowed_origins" {
  type        = list(string)
  default     = []
  description = "List of allowed origins (e.g. example.com, test.com) for S3 bucket"
}

variable "cors_expose_headers" {
  type        = list(string)
  default     = ["ETag"]
  description = "List of expose header in the response for S3 bucket"
}

variable "cors_max_age_seconds" {
  default     = 3600
  description = "Time in seconds that browser can cache the response for S3 bucket"
}

variable "forward_cookies" {
  type        = string
  default     = "none"
  description = "Time in seconds that browser can cache the response for S3 bucket"
}

variable "forward_header_values" {
  type        = list(string)
  description = "A list of whitelisted header values to forward to the origin"
  default     = ["Access-Control-Request-Headers", "Access-Control-Request-Method", "Origin"]
}

variable "price_class" {
  type        = string
  default     = "PriceClass_100"
  description = "Price class for this distribution: `PriceClass_All`, `PriceClass_200`, `PriceClass_100`"
}

variable "viewer_protocol_policy" {
  type        = string
  description = "allow-all, redirect-to-https"
  default     = "redirect-to-https"
}

variable "allowed_methods" {
  type        = list(string)
  default     = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
  description = "List of allowed methods (e.g. GET, PUT, POST, DELETE, HEAD) for AWS CloudFront"
}

variable "cached_methods" {
  type        = list(string)
  default     = ["GET", "HEAD"]
  description = "List of cached methods (e.g. GET, PUT, POST, DELETE, HEAD)"
}

variable "default_ttl" {
  default     = 60
  description = "Default amount of time (in seconds) that an object is in a CloudFront cache"
}

variable "min_ttl" {
  default     = 0
  description = "Minimum amount of time that you want objects to stay in CloudFront caches"
}

variable "max_ttl" {
  default     = 31536000
  description = "Maximum amount of time (in seconds) that an object is in a CloudFront cache"
}

variable "trusted_signers" {
  type        = list(string)
  default     = []
  description = "The AWS accounts, if any, that you want to allow to create signed URLs for private content. 'self' is acceptable."
}

variable "geo_restriction_type" {
  # e.g. "whitelist"
  default     = "none"
  description = "Method that use to restrict distribution of your content by country: `none`, `whitelist`, or `blacklist`"
  type        = string
}

variable "geo_restriction_locations" {
  type = list(string)

  # e.g. ["US", "CA", "GB", "DE"]
  default     = []
  description = "List of country codes for which  CloudFront either to distribute content (whitelist) or not distribute your content (blacklist)"
}

variable "parent_zone_id" {
  type        = string
  default     = ""
  description = "ID of the hosted zone to contain this record  (or specify `parent_zone_name`)"
}

variable "parent_zone_name" {
  type        = string
  default     = ""
  description = "Name of the hosted zone to contain this record (or specify `parent_zone_id`)"
}

variable "null" {
  description = "an empty string"
  default     = ""
}

variable "static_s3_bucket" {
  type    = string
  default = "aws-cli"

  description = <<DOC
aws-cli is a bucket owned by amazon that will perminantly exist.
It allows for the data source to be called during the destruction process without failing.
It doesn't get used for anything else, this is a safe workaround for handling the fact that
if a data source like the one `aws_s3_bucket.selected` gets an error, you can't continue the terraform process
which also includes the 'destroy' command, where is doesn't even need this data source!
Don't change this bucket name, it's a variable so that we can provide this description.
And this works around a problem that is an edge case.
DOC
}

variable "custom_error_response" {
  # http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/custom-error-pages.html#custom-error-pages-procedure
  # https://www.terraform.io/docs/providers/aws/r/cloudfront_distribution.html#custom-error-response-arguments
  type = list(object({
    error_caching_min_ttl = string
    error_code            = string
    response_code         = string
    response_page_path    = string
  }))

  description = "List of one or more custom error response element maps"
  default     = []
}

variable "lambda_function_association" {
  type = list(object({
    event_type   = string
    include_body = bool
    lambda_arn   = string
  }))

  description = "A config block that triggers a lambda function with specific actions"
  default     = []
}

variable "web_acl_id" {
  type        = string
  default     = ""
  description = "ID of the AWS WAF web ACL that is associated with the distribution"
}

variable "wait_for_deployment" {
  type        = bool
  default     = true
  description = "When set to 'true' the resource will wait for the distribution status to change from InProgress to Deployed"
}

variable "website_config" {
  type        = map(any)
  default     = {}
  description = "(Optional) A list of website configs to configure the s3 bucket as a static s3 website. See: https://www.terraform.io/docs/providers/aws/r/s3_bucket.html#website"
}

variable "versioning_enabled" {
  type        = bool
  default     = false
  description = "Enable or disable versioning"
}

variable "lifecycle_rule_enabled" {
  type        = bool
  default     = null
  description = "(Optional) Enable or disable lifecycle rule, set to false to create the rules but keep them disabled. Default behavior is dont create the rules."
}

variable "lifecycle_rule_prefix" {
  type        = string
  default     = ""
  description = "(Optional) Prefix identifying one or more objects to which the lifecyle rule applies"
}

variable "noncurrent_version_transition_config" {
  type = list(object({
    days          = number
    storage_class = string
  }))
  default     = []
  description = "(Optional) An S3 bucket noncurrent_version_transition config, see: https://www.terraform.io/docs/providers/aws/r/s3_bucket.html#noncurrent_version_transition"
}

variable "noncurrent_version_expiration_days" {
  type        = number
  default     = null
  description = "(Optional) Specifies when noncurrent object versions expire, default is don't expire noncurrent object versions."
}

variable "transition_config" {
  type = list(object({
    days          = number
    storage_class = string
  }))
  default     = []
  description = "(Optional) An S3 bucket transition config, see: https://www.terraform.io/docs/providers/aws/r/s3_bucket.html#noncurrent_version_transition"
}

variable "expiration_days" {
  type        = number
  default     = null
  description = "(Optional) Specifies when objects expire, default is don't expire objects."
}

variable "replication_source_principal_arns" {
  type        = list(string)
  default     = []
  description = "(Optional) List of principal ARNs to grant replication access from different AWS accounts"
}

variable "deployment_arns" {
  type        = map(any)
  default     = {}
  description = "(Optional) Map of deployment ARNs to lists of S3 path prefixes to grant `deployment_actions` permissions"
}

variable "deployment_actions" {
  type        = list(string)
  default     = ["s3:PutObject", "s3:PutObjectAcl", "s3:GetObject", "s3:DeleteObject", "s3:ListBucket", "s3:ListBucketMultipartUploads", "s3:GetBucketLocation", "s3:AbortMultipartUpload"]
  description = "List of actions to permit deployment ARNs to perform"
}

variable "origin_http_port" {
  description = "(Optional) - The HTTP port the custom origin listens on. Ignored if not configured with a static s3 website endpoint - i.e. website_config is set."
  default     = "80"
}

variable "origin_https_port" {
  description = "(Optional) - The HTTPS port the custom origin listens on. Ignored if not configured with a static s3 website endpoint - i.e. website_config is set."
  default     = "443"
}

variable "origin_protocol_policy" {
  description = "(Optional) - The origin protocol policy to apply to your origin. One of http-only, https-only, or match-viewer. Ignored if not configured with a static s3 website endpoint - i.e. website_config is set."
  default     = "match-viewer"
}

variable "origin_ssl_protocols" {
  description = "(Optional) - The SSL/TLS protocols that you want CloudFront to use when communicating with your origin over HTTPS. Ignored if not configured with a static s3 website endpoint - i.e. website_config is set."
  type        = list(string)
  default     = ["TLSv1", "TLSv1.1", "TLSv1.2"]
}

variable "origin_keepalive_timeout" {
  description = "(Optional) The Custom KeepAlive timeout, in seconds. By default, AWS enforces a limit of 60. But you can request an increase. Ignored if not configured with a static s3 website endpoint - i.e. website_config is set."
  default     = "60"
}

variable "origin_read_timeout" {
  description = "(Optional) The Custom Read timeout, in seconds. By default, AWS enforces a limit of 60. But you can request an increase. Ignored if not configured with a static s3 website endpoint - i.e. website_config is set."
  default     = "60"
}

variable "create_cloudfront_distribution" {
  description = "(Optional) Set to false to disable creation of the CloudFront Distribution CDN"
  default     = true
}

variable "allowed_referers" {
  description = "(Optional) Set to only allow requests to the s3 bucket from these referers"
  default     = []
}

variable "referer_secret" {
  description = "(Optional) Enforce all requests pass through the CloudFront CDN. This secret will be injected as the referer in the CloudFront CDN. This is combined with the allowed referers in the S3 bucket policy, to ONLY allow requests through the CF CDN ensure allowed_referers is not set"
  type        = string
  default     = null
}

variable "read_access_ips" {
  default     = []
  type        = list(string)
  description = "list of ips to get read access to the bucket"
}

variable "full_access_ips" {
  default     = []
  type        = list(string)
  description = "list of ips to get full access to the bucket"
}

variable "domain_name" {
  type        = string
  default     = null
  description = "(Optional) Domain name to use as the bucket name to allow for Route53 DNS A records for the buckets website endpoint"
}
