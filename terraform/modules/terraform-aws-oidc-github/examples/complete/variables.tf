variable "attach_admin_policy" {
  default     = false
  description = "Flag to enable/disable the attachment of the AdministratorAccess policy."
  type        = bool
}

variable "attach_read_only_policy" {
  default     = true
  description = "Flag to enable/disable the attachment of the ReadOnly policy."
  type        = bool
}

variable "enabled" {
  default     = true
  description = "Flag to enable/disable the creation of resources."
  type        = bool
}

variable "force_detach_policies" {
  default     = false
  description = "Flag to force detachment of policies attached to the IAM role."
  type        = string
}

variable "github_organisation" {
  description = "GitHub organisation name."
  type        = string
}

variable "github_repositories" {
  description = "List of GitHub repository names."
  type        = list(string)
}

variable "github_thumbprint" {
  default     = "6938fd4d98bab03faadb97b34396831e3780aea1"
  description = "GitHub OpenID TLS certificate thumbprint."
  type        = string
}

variable "iam_policy_name" {
  default     = "github"
  description = "Name of the IAM policy to be assumed by GitHub."
  type        = string
}

variable "iam_policy_path" {
  default     = "/"
  description = "Path to the IAM policy."
  type        = string
}

variable "iam_role_name" {
  default     = "github"
  description = "Name of the IAM role."
  type        = string
}

variable "iam_role_path" {
  default     = "/"
  description = "Path to the IAM role."
  type        = string
}

variable "iam_role_permissions_boundary" {
  default     = ""
  description = "ARN of the permissions boundary to be used by the IAM role."
  type        = string
}

variable "iam_role_policy_arns" {
  default     = []
  description = "List of IAM policy ARNs to attach to the IAM role."
  type        = list(string)
}

variable "max_session_duration" {
  default     = 3600
  description = "Maximum session duration in seconds."
  type        = number

  validation {
    condition     = var.max_session_duration >= 3600 && var.max_session_duration <= 43200
    error_message = "Maximum session duration must be between 1 and 12 hours."
  }
}

variable "region" {
  description = "AWS region in which to apply resources."
  type        = string
}

variable "tags" {
  default     = {}
  description = "Map of tags to be applied to all resources."
  type        = object({})
}
