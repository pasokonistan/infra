resource "discord_category_channel" "voice" {
  name      = "ボイスチャンネル"
  server_id = discord_server.pasokonistan.id
  position  = 1
}
