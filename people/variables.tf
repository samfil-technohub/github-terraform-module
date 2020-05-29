variable "collaborator_repository_permission" {
  description = "Add Collaborators to Repository with appropriate Permission"
  type           = list(object({
    collaborator = string
    repository   = string
    permission   = string
  }))
}

variable "description" {
  description = "The Description of the Repository"
  type        = string
}

variable "github_administrator" {
  description = "The Github Admin User"
  type        = string
}

variable "github_users" {
  description = "Create/Add Github Users"
  type        = list(string)
}

variable "privacy_status" {
  description = "Is the Team Closed or Secret"
  default     = "closed"
  type        = string
}

variable "repository_permission" {
  description   = "Team Repository Permission"
  type          =  map(string)
}

variable "team_name" {
  description = "The Name of the Team i.e Project-[Dev or Op]"
  type        = string
}