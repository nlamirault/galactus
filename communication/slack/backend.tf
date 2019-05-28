terraform {
  backend "gcs" {
    bucket = "galactus-nlamirault"
    prefix = "communication/slack/lamirault.tfstate"
  }
}
