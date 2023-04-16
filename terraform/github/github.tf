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

provider "github" {}
