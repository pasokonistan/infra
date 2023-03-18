resource "discord_category_channel" "voice" {
  name      = "ボイスチャンネル"
  server_id = discord_server.pasokonistan.id
  position  = 1
}

resource "discord_voice_channel" "vc" {
  server_id = discord_server.pasokonistan.id
  category  = discord_category_channel.voice.id
  name      = "vc"
  position  = 0
}
resource "discord_text_channel" "vc_text" {
  server_id = discord_server.pasokonistan.id
  category  = discord_category_channel.voice.id
  name      = "vc_text"
}
