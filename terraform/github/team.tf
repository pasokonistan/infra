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
