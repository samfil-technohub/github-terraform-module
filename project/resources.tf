# Define Issue Labels
resource "github_issue_label" "label" {
  count = length(var.issue_labels)
  repository  = var.repo_name
  name        = var.issue_labels[count.index].name
  description = var.issue_labels[count.index].description
  color       = var.issue_labels[count.index].color
}

# Project Management
resource "github_repository_project" "project" {
  name       = var.repo_name
  repository = var.repo_name
}

# Project Columns
resource "github_project_column" "project_columns" {
  count      = length(var.project_columns)
  name       = element(var.project_columns, count.index)
  project_id = github_repository_project.project.id
}