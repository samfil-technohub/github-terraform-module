# The Repository URLs and Name
output "html_url" {
  value = github_repository.repository.html_url
}

output "http_clone_url" {
  value = github_repository.repository.http_clone_url
}

output "repo_name" {
  value = github_repository.repository.name
}

output "ssh_clone_url" {
  value = github_repository.repository.ssh_clone_url
}