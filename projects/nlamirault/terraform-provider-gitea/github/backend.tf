terraform {
  backend "gcs" {
    bucket = "galactus-nlamirault"
    prefix = "projects/nlamirault/terraform-provider-gitea/github.tfstate"
  }
}
