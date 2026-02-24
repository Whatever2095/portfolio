terraform {
  required_providers {
    netlify = {
      source = "netlify/netlify"
      version = "0.6.1"
    }
  }
}

provider "netlify" {
  # We will pass the token via environment variable for security
  # export NETLIFY_TOKEN=your_token_here
}

# Define the Portfolio Site
resource "netlify_site" "sre_portfolio" {
  name = "neelima-sre-portfolio" 

  # Link to your GitHub Repository
  repo {
    provider    = "github"
    repo_path   = "Whatever2095/portfolio" 
    branch      = "main"
    
    # The directory where the HTML site lives
    dir         = "html5up-strata" 
    
    # We leave the command empty because it's static HTML
    command     = "" 
  }
}

# Output the live URL after deployment
output "live_url" {
  value = netlify_site.sre_portfolio.url
}