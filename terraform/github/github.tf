terraform {
  cloud {
    organization = "pasokonistan"

    workspaces {
      name = "infra-github"
    }
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.22.0"
    }
  }
}

provider "github" {
  owner = "pasokonistan"

  # https://registry.terraform.io/providers/integrations/github/latest/docs#github-app-installation
  app_auth {}
}
