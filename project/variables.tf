variable "issue_labels" {
  description   = "The Issue Labels"
  type          = list(object({
    name        = string
    description = string
    color       = string
  }))
}

variable "project_columns" {
  description = "Project Columns"
  type        = list(string)
}

variable "repo_name" {
  description = "The Repository Name"
  type        = string
}

