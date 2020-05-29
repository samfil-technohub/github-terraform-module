## Documentation

This is a submodule in the github-terraform-module which groups resources related to project management. Entities like project columns, and issues labels.

**This submodule requires about 3 arguments.**
  - _repo_name_: <text> The name of the repository to instantiate a project upon </text>
  - _issue_labels_: <text> A map of an issue label which details the name, description and color. </text>
  - _project_columns_: <text> A list of names for project columns i.e ["Do", "Doing", "Test", "Done"]</text>
  
### **Usage**
---
```hcl
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