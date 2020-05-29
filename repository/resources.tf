# Create Repository
resource "github_repository" "repository" {
  name              = var.repo_name
  auto_init         = var.enable_auto_init
  default_branch    = var.default_branch
  description       = var.description
  has_issues        = var.enable_issues_feature
  has_projects      = var.enable_projects_feature
  has_wiki          = var.enable_wiki_feature
  license_template  = var.license_template
  private           = var.enable_private
}

# Create Branches in Repo
resource "github_branch" "create_branches" {
  branch     = element(var.create_branches, count.index)
  count      = length(var.create_branches)
  repository = github_repository.repository.name  
}

# Protection Specific Branches
resource "github_branch_protection" "protect_branches" {
  branch          = element(var.protect_branches, count.index)
  count           = length(var.protect_branches)
  depends_on      = [github_branch.create_branches]
  enforce_admins  = true
  repository      = github_repository.repository.name
  
  required_status_checks {
    strict   = var.enable_strict_checks
    contexts = var.status_checks_contexts
  }

  required_pull_request_reviews {
    dismissal_teams       = var.dismissal_teams_slug
    dismiss_stale_reviews = var.enable_reviews_dismissal
    required_approving_review_count = var.approval_threshold
  }

  restrictions {
    apps  = var.allow_push_for_apps
    users = var.allow_push_for_users
  }
}

# Define a Webhook for the Repository
resource "github_repository_webhook" "repository_webhook" {
  active = true

  configuration {
    content_type = var.webhook_content_type
    insecure_ssl = var.enable_insecure_ssl
    secret       = var.webhook_secret
    url          = "${var.webhook_protocol}://${var.automation_server_uri}/github-webhook/"
  }

  events = var.events_trigger
  repository = github_repository.repository.name
}
