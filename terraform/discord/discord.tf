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
  name          = "パソコニスタン"
  region        = "japan"
  icon_data_uri = data.discord_local_image.logo.data_uri
}
data "discord_local_image" "logo" {
  file = "./computer_screen_programming.png"
}

resource "discord_invite" "bootstrap" {
  channel_id = discord_text_channel.entrypoint.id
  max_uses   = 1
}

output "invite_link_bootstrap" {
  description = "bootstrap invite link"
  value       = "https://discord.gg/${discord_invite.bootstrap.id}"
}
