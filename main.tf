terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.3.0"
    }
  }
}
provider "github" {
  organization = "SynergyDevops"
  #version = "~> 4.0"
}

resource "github_branch_protection_v3" "main_protection" {
  repository     = "${var.repository}"
  branch        = "main"
  enforce_admins = true
  require_signed_commits = true
  require_conversation_resolution = true
  requiredLinearHistory = true
  allow_force_push = true
  allow_deletions = true
  
  required_status_checks {
    strict   = false
    contexts = ["ci/travis"]
  }
  required_pull_request_reviews {
    dismiss_stale_reviews  = true
    required_approving_review_count = 2
    require_code_owner_reviews = false
  }
}
