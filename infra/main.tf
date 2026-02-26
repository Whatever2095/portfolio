terraform {
  required_providers {
    netlify = {
      source  = "sry270/netlify"
      version = "0.1.1"
    }
  }
}

provider "netlify" {
  # We will use the NETLIFY_TOKEN environment variable
  # export NETLIFY_TOKEN=your_token_here
}

resource "netlify_site" "sre_portfolio" {
  name = "neelima-sre-portfolio-2025" # Make sure this is unique

  repo {
    provider    = "github"
    repo_path   = "Whatever2095/portfolio"
    branch      = "main"
    dir         = "html5up-strata"
    command     = "" 
  }
}

output "live_url" {
  value = netlify_site.sre_portfolio.url
}