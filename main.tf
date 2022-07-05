provider "github" {
  token = var.git_token
}

resource "github_repository" "repositories" {
  count       = length(var.repositoriesList)
  name        = element(var.repositoriesList, count.index).repoName
  description = element(var.repositoriesList, count.index).repoDescription
  visibility  = element(var.repositoriesList, count.index).repoVisibility
}

output "git_info" {
  value = tomap({
    for i, info in github_repository.repositories : i => {
      Name        = info.name
      Description = info.description
      SSH         = info.ssh_clone_url
      HTTP        = info.http_clone_url
    }
  })
}
