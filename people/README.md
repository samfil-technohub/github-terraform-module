## Documentation

This is a submodule in the github-terraform-module which groups resources related to people. Entities like team, and members - including  core users and collaborators.

**This submodule requires about 7 arguments.**
  - _team_name_: <text> The desired name for the team e.g developers </text>
  - _description_: <text> A description of the team</text>
  - _privacy_status_: <text> The visibility level of the team, one of <code><em>closed or secret.</em></code></text>
  - _github_administrator_: <text> The github user that will have the maintainer role</text>
  - _github_users_: <text> A list of all the github users that will be part of this team. Also include the github_administrator user here. </text>
  - _repository_permission_: <text> repository and corresponding permission to add to this team. </text>
  - _collaborator_repository_permission_: <text> a github user, the repository and corresponding permission to assign to invited collaborators not part of the team. </text>

### **Usage**
---
```hcl
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
    (module.xyz_config.repo_name) = "push"
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
```