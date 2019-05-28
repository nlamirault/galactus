terraform {
  backend "gcs" {
    bucket = "galactus-nlamirault"
    prefix = "dns/gandi/lamirault-xyz.tfstate"
  }
}
