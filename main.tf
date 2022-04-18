terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.3.0"
    }
  }
}
provider "github" {
  organization = "philips-internal"
  #version = "~> 4.0"
}

resource "github_branch_protection_v3" "main_protection" {
  repository     = "${var.repository}"
  branch          = "main"
  enforce_admins   = true
  required_pull_request_reviews {
    dismiss_stale_reviews  = true
    required_approving_review_count = 2
  }
}
