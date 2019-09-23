terraform {
  backend "gcs" {
    bucket = "galactus-nlamirault"
    prefix = "projects/nlamirault/manifests/github.tfstate"
  }
}
