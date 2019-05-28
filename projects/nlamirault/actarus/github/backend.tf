terraform {
  backend "gcs" {
    bucket = "galactus-nlamirault"
    prefix = "projects/nlamirault/actarus/github.tfstate"
  }
}
