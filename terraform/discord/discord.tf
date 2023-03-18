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

variable "DISCORD_TERRAFORM_TOKEN" {}

provider "discord" {
  token = var.DISCORD_TERRAFORM_TOKEN
}

resource "discord_server" "pasokonistan" {
  name   = "パソコニスタン"
  region = "japan"
}
