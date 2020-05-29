# Create Team
resource "github_team" "team" {
  name        = var.team_name
  description = var.description
  privacy     = var.privacy_status
}

# Assign Members to Team
resource "github_team_membership" "team_members" {
  for_each = toset(var.github_users)
  team_id  = github_team.team.id
  role     = each.value == "${var.github_administrator}" ? "maintainer" : "member"
  username = each.value
}

# Assign a Repositories to Team
resource "github_team_repository" "team_repositories" {
  for_each   = var.repository_permission
  team_id    = github_team.team.id 
  repository = each.key 
  permission = each.value  
}

# Add Collaborators to a Repository
resource "github_repository_collaborator" "collaborators" {
  count      = length(var.collaborator_repository_permission)
  username   = var.collaborator_repository_permission[count.index].collaborator
  repository = var.collaborator_repository_permission[count.index].repository
  permission = var.collaborator_repository_permission[count.index].permission
}