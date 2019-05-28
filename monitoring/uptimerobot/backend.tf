terraform {
  backend "gcs" {
    bucket = "galactus-nlamirault"
    prefix = "monitoring/uptimerobot/lamirault.tfstate"
  }
}
