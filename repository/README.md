## Documentation

This is a submodule in the github-terraform-module which groups resources related to a repository. Creating entities like repository, branches, branch protection, a repository webhook and including continous integration to the repository.

**This submodule requires about 25 arguments.**
  - _allow_push_for_apps_: <text> applications to grant a push access on protected branches </text>
  - _allow_push_for_apps_: <text> users to grant a push access on protected branches </text>
  - _approval_threshold_: <text> the desired number of reviews before merge </text>
  - _description_: <text> A description of the repository </text>
  - _automation_server_uri_: <text> The URI for your automation tool i.e Travis, CircleCI or Jenkins </text>
  - _create_branches_: <text> A list of branches to Create </text>
  - _default_branch_: <text> The desired default branch for this repository </text>
  - _dismissal_teams_slug_: <text> a team name slug with dissmal rights. </text>
  - _enable_auto_init_: <text> initialize the repository with a README.md </text>
  - _enable_insecure_ssl_: <text> enable if the certificate is self-signed </text>
  - _enable_issues_feature_: <text> enable the issues feature for this repository </text>
  - _enable_projects_feature_: <text> enable the project feature for this repository </text>
  - _enable_reviews_dissmal_: <text> enable dismissal for stale reviews </text>
  - _enable_strict_checks_: <text> enable strictly running the countinous integration </text>
  - _enable_wiki_feature_: <text> enable a wiki for this repository </text>
  - _events_trigger_: <text> events to trigger the webhook </text>
  - _license_template_: <text> license template for the repository </text>
  - _protect_branches_: <text> a list of branches to protect </text>
  - _repo_name_: <text> the desired name for the repository </text>
  - _status_checks_contexts_: <text> the countinous integration app to apply. This should be a publish app in the market or a github actions job name. </text>
  - _webhook_content_type_: <text> the content type of the webhook i.e json or form </text>
  - _webhook_protocol_: <text> the webhook protocol i.e https or http </text>
  - _webhook_secret_: <text> the webhook secret if you choose </text>

### **Usage**
---
```hcl
## Repository
# Application
module "xyz" {
  source                  = "github.com/samfil-technohub/github-terraform-module.git//repository"
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
```