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

resource "discord_text_channel" "zatsu" {
  name      = "雑"
  server_id = discord_server.pasokonistan.id
  category  = discord_category_channel.pasokon.id
}

resource "discord_text_channel" "pasokey" {
  name      = "pasokey"
  server_id = discord_server.pasokonistan.id
  category  = discord_category_channel.pasokon.id
}
