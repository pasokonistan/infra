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

resource "discord_category_channel" "pasokon" {
  name      = "パソコン"
  server_id = discord_server.pasokonistan.id
  position  = 0
}

resource "discord_text_channel" "entrypoint" {
  name      = "entrypoint"
  server_id = discord_server.pasokonistan.id
  category  = discord_category_channel.pasokon.id
  position  = 0
}

resource "discord_invite" "bootstrap" {
  channel_id = discord_text_channel.entrypoint.id
  max_uses   = 1
}

output "invite_link_bootstrap" {
  description = "bootstrap invite link"
  value       = "https://discord.gg/${discord_invite.bootstrap.id}"
}
