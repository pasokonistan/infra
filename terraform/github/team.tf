locals {
  users_paspkonistan = [
    "sksat",
    "Totsugekitai",
  ]
  users_infra = [
    "sksat",
  ]
  users_infra_admin = [
    "sksat",
  ]
}

# team
## https://docs.github.com/ja/rest/reference/teams#create-a-team--parameters
##   privacy=secret: only visible to organization owners and members of this team.
##   privacy=closed: visible to all members of this organization.

resource "github_team" "pasokonistan" {
  name        = "pasokonistan"
  description = "pasokonistan"
  privacy     = "closed"
}

resource "github_team" "infra" {
  name        = "infra"
  description = "infra team"
  privacy     = "closed"
}

resource "github_team" "infra_admin" {
  parent_team_id = github_team.infra.id
  name           = "infra-admin"
  description    = "infra admin"
  privacy        = "closed"
}


resource "github_team_membership" "pasokonistan" {
  team_id = github_team.pasokonistan.id

  for_each = toset(local.users_paspkonistan)
  username = each.value
  role     = each.value == local.users_paspkonistan[0] ? "maintainer" : "member"
}
resource "github_team_membership" "infra" {
  team_id = github_team.infra.id

  for_each = toset(local.users_infra)
  username = each.value
  role     = each.value == local.users_infra[0] ? "maintainer" : "member"
}
resource "github_team_membership" "infra_admin" {
  team_id = github_team.infra_admin.id

  for_each = toset(local.users_infra_admin)
  username = each.value
  role     = each.value == local.users_infra_admin[0] ? "maintainer" : "member"
}
