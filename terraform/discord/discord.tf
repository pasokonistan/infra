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
  owner_id      = "281041763009822720" # Cycle: data.discord_member.sksat.id
  icon_data_uri = data.discord_local_image.logo.data_uri
}
data "discord_local_image" "logo" {
  file = "./computer_screen_programming.png"
}

data "discord_member" "sksat" {
  server_id = discord_server.pasokonistan.id
  user_id   = "281041763009822720"
}
