terraform {
  backend "gcs" {
    bucket = "galactus-nlamirault"
    prefix = "projects/nlamirault/bento/github.tfstate"
  }
}
