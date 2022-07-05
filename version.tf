terraform {
  required_providers {
    github = {
      source  = "local/integrations/github"
      version = ">= 4.26.1"
    }
  }
}
