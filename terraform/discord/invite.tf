resource "discord_invite" "bootstrap" {
  channel_id = discord_text_channel.entrypoint.id
  max_uses   = 1
}

output "invite_link_bootstrap" {
  description = "bootstrap invite link"
  value       = "https://discord.gg/${discord_invite.bootstrap.id}"
}

resource "discord_invite" "main" {
  channel_id = discord_text_channel.entrypoint.id
  max_uses   = 100
}
output "invite_link_main" {
  description = "main invite link"
  value       = "https://discord.gg/${discord_invite.main.id}"
}
