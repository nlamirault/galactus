terraform {
  backend "gcs" {
    bucket = "galactus-nlamirault"
    prefix = "projects/nlamirault/divona/github.tfstate"
  }
}
