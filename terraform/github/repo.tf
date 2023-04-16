resource "github_repository" "infra" {
  name        = "infra"
  description = ""
  visibility  = "private"

  has_downloads = true
  has_issues    = true
  has_projects  = true

  allow_merge_commit = true
  allow_rebase_merge = false
  allow_squash_merge = false

  merge_commit_title   = "MERGE_MESSAGE"
  merge_commit_message = "PR_TITLE"

  squash_merge_commit_message = "COMMIT_MESSAGES"
  squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
}
