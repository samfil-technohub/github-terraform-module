## Documentation

This is a module implements a great bulk of provisioning various github resources - repository, teams, branches webhook, project etc. It sub-modular designed to allow for orchestrating resources which makes sense collectively and as well give room to strip some overhead if the use case does not apply for the project.

For instance, a user could choose to stand a repository with this module without the need for adding teams or instanting a project management if they do not deem so. Some arguments for the repository can also be turned off if the user do not wish to activate them.

### **Usage**
---
```hcl
## Repository
# Application
module "xyz" {
  source                  = "github.com/samfil-technohub/github-terraform-module.git//repository"
  version = "1.0.0"
  allow_push_for_apps     = []
  allow_push_for_users    = []
  approval_threshold      = null
  automation_server_uri   = "192.168.25.1:8080"
  create_branches         = ["development","release"]
  default_branch          = "master"
  description             = "Codebase for XYZ App"
  dismissal_teams_slug    = []
  enable_auto_init        = true
  enable_insecure_ssl     = null
  enable_issues_feature   = true
  enable_private          = false
  enable_projects_feature = true
  enable_reviews_dismissal= null
  enable_strict_checks    = null
  enable_wiki_feature     = false
  events_trigger          = []
  license_template        = "mit"
  protect_branches        = ["master","release"]
  repo_name               = "xyz"
  status_checks_contexts  = []
  webhook_content_type    = "form"
  webhook_protocol        = "http"
  webhook_secret          = ""
}

## People
# Operators
module "xyz_ops" {
  source                = "github.com/samfil-technohub/github-terraform-module.git//people"
  version = "1.0.0"
  team_name             = "xyz-ops"   # name of the team
  description           = "The Operators"
  privacy_status        = "secret"
  github_administrator  = "github_username1"
  github_users          = ["github_username1", "github_username2"]
  # Note: repo name is interpolated from earlier created repository module. You may also pass the name thus: ("xyz-app")
  repository_permission = {
    (module.xyz.repo_name)        = "push"
  }
  collaborator_repository_permission = [
    {
      collaborator  = "github_username3"
      repository  	= module.xyz.repo_name
      permission    = "pull"
    },
    {
      collaborator  = "github_username4"
      repository  	= module.xyz_config.repo_name
      permission    = "push"
    },
  ]
}

## Project Management
# xyz
module "xyz_project" {
  source = "github.com/samfil-technohub/github-terraform-module.git//project"
  version = "1.0.0"
  repo_name = "xyz-app"     # name of the repository not url.
  project_columns = ["Do","Doing","Done"]
  issue_labels = [
    {
      name        = "bug"
      description = "Something is not working"
      color       = "d73a4a"
    },
    {
      name        = "documentation"
      description = "Improvements to documentation"
      color       = "0075ca"
    },
    {
      name        = "enhancement"
      description = "New feature or request"
      color       = "a2eeef"
    }
  ]
}
```