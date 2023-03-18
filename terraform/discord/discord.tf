terraform {
  cloud {
    organization = "pasokonistan"

    workspaces {
      name = "infra-discord"
    }
  }

  required_providers {
    discord = {
      source  = "Lucky3028/discord"
      version = "1.3.0"
    }
  }
}

