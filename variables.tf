variable "git_token" {
  description = "Github token key"
  type        = string
}

variable "repositoriesList" {
  description = "List of repositories for deploy"
  type = list(object({
    repoName        = string,
    repoDescription = string,
    repoVisibility  = string,
  }))
  default = [
    {
      repoName        = "terraform-deploy-gitgub",
      repoDescription = "TF. Deploy and config repositories",
      repoVisibility  = "public",
    },
  ]
}
