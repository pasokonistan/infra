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

resource "github_branch_protection" "infra" {
  repository_id = github_repository.infra.node_id

  pattern = "main"

  allows_deletions    = false
  allows_force_pushes = false
  blocks_creations    = false
  enforce_admins      = false
  lock_branch         = false

  require_conversation_resolution = false
  require_signed_commits          = true
  required_linear_history         = false # Enable squashing or rebasing merge strategy on this repository to use this rule.

  required_status_checks {
    strict = true
    contexts = [
      "Terraform Cloud/pasokonistan/infra-github",
      "Terraform Cloud/pasokonistan/infra-discord",
    ]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews      = true
    require_code_owner_reviews = true

    required_approving_review_count = 0
  }
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

resource "github_repository" "pasopedia" {
  name         = "pasopedia"
  description  = ""
  homepage_url = "https://pasopedia.pasokon.site"
  visibility   = "public"

  has_downloads = true
  has_issues    = true
  has_projects  = true
  has_wiki      = true

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

resource "github_repository_collaborators" "pasopedia" {
  repository = github_repository.pasopedia.name

  user {
    username   = "Amphitrite632"
    permission = "maintain"
  }
}
