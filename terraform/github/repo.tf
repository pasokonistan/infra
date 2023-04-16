resource "github_repository" "infra" {
  name        = "infra"
  description = "pasokonistan infrastracture"
  visibility  = "public"

  has_downloads = true
  has_issues    = true
  has_projects  = true

  allow_merge_commit = true
  allow_rebase_merge = false
  allow_squash_merge = false

  allow_update_branch    = true
  delete_branch_on_merge = true

  merge_commit_title   = "MERGE_MESSAGE"
  merge_commit_message = "PR_TITLE"

  squash_merge_commit_message = "COMMIT_MESSAGES"
  squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
}

resource "github_team_repository" "infra" {
  team_id    = github_team.infra.id
  repository = github_repository.infra.name
  permission = "pull"
}

resource "github_repository" "pasokon-site" {
  name         = "pasokon.site"
  description  = "パソコニスタン首都"
  homepage_url = "https://pasokon.site"
  visibility   = "public"

  has_downloads = true
  has_issues    = true
  has_projects  = true

  allow_merge_commit = true
  allow_rebase_merge = false
  allow_squash_merge = false

  allow_update_branch    = true
  delete_branch_on_merge = true

  merge_commit_title   = "MERGE_MESSAGE"
  merge_commit_message = "PR_TITLE"

  squash_merge_commit_message = "COMMIT_MESSAGES"
  squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"

  vulnerability_alerts = true
}
