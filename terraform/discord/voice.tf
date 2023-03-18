resource "discord_category_channel" "voice" {
  name      = "ボイスチャンネル"
  server_id = discord_server.pasokonistan.id
  position  = 1
}

resource "discord_voice_channel" "general" {
  name      = "vc"
  server_id = discord_server.pasokonistan.id
  category  = discord_category_channel.voice.id
  position  = 0
}
