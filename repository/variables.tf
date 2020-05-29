variable "allow_push_for_apps" {
  description = "The Apps with Push Access on Protected Branches"
  type        = list(string)
}

variable "allow_push_for_users" {
  description = "The Users with Push Access on Protected Branches"
  type        = list(string)
}

variable "approval_threshold" {
  description = "The Number of Review Approval Before Merge"
  type        = number
}

variable "automation_server_uri" {
  description = "Automation Application URI i.e IP/DomainName:PORT"
  type        = string
}

variable "create_branches" {
  description = "The Branches to Create"
  type        = list(string)
}

variable "default_branch" {
  description = "The Default Branch"
  type        = string
}

variable "description" {
  description = "The Description of the Repository"
  type        = string
}

variable "dismissal_teams_slug" {
  description = "The Team to Dismiss"
  type        = list(string)
}

variable "enable_auto_init" {
  description = "Should the Repository be Initialized with a README.md"
  default     = true
  type        = bool
}

variable "enable_insecure_ssl" {
  description = "Enable Insecure SSL if Self-Signed"
  default     = null
  type        = bool
}

variable "enable_issues_feature" {
  description = "Enable Issues Feature"
  default     = null
  type        = bool
}

variable "enable_private" {
  description = "Should the Repository be Private"
  default     = null
  type        = bool
}

variable "enable_projects_feature" {
  description = "Enable Projects Feature"
  default     = null
  type        = bool
}

variable "enable_reviews_dismissal" {
  description = "Dimiss Existing Reviews on New Push"
  default     = null
  type        = bool
}

variable "enable_strict_checks" {
  description = "Always Run the Checks"
  default     = null
  type        = bool
}

variable "enable_wiki_feature" {
  description = "Enable Wiki Feature"
  default     = null
  type        = bool
}

variable "events_trigger" {
  description = "Webhook Events that Trigger the Repository"
  type        = list(string)
}

variable "license_template" {
  description = "The License of the Repository"
  type        = string
}

variable "protect_branches" {
  description = "The Branches to Protect"
  type        = list(string)
}

variable "repo_name" {
  description = "The Repository Name"
  type        = string
}

variable "status_checks_contexts" {
  description = "The Automation Checks to Run"
  type        = list(string)
}

variable "webhook_content_type" {
  description = "The Webhook Content Format i.e form or json"
  type        = string
}

variable "webhook_protocol" {
  description = "The Webhook Protocol i.e http or https"
  type        = string
}

variable "webhook_secret" {
  description = "The Webhook Secret for the Repository"
  type        = string
}
