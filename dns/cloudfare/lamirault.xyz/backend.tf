terraform {
  backend "gcs" {
    bucket = "galactus-nlamirault"
    prefix = "dns/cloudfare/lamirault-xyz.tfstate"
  }
}
