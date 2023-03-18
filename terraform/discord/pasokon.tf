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
