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
      version = "5.45.0"
    }
  }
}

provider "github" {
  owner = "pasokonistan"

  # https://registry.terraform.io/providers/integrations/github/latest/docs#github-app-installation
  app_auth {}
}

resource "github_organization_settings" "pasokonistan" {
  name        = "pasokonistan"
  description = "パソコンの国，パソコニスタン"

  billing_email = "sksat+pasokonistan@sksat.net"
  blog          = "https://pasokon.site/"

  default_repository_permission = "none"

  has_organization_projects = true
  has_repository_projects   = true

  members_can_create_repositories          = true
  members_can_create_public_repositories   = true
  members_can_create_private_repositories  = true
  members_can_create_internal_repositories = false
  members_can_create_pages                 = true
  members_can_create_public_pages          = true
  members_can_create_private_pages         = true
  members_can_fork_private_repositories    = false

  web_commit_signoff_required = false

  advanced_security_enabled_for_new_repositories = false

  dependabot_alerts_enabled_for_new_repositories           = false
  dependabot_security_updates_enabled_for_new_repositories = false
  dependency_graph_enabled_for_new_repositories            = false

  secret_scanning_enabled_for_new_repositories                 = false
  secret_scanning_push_protection_enabled_for_new_repositories = false
}
