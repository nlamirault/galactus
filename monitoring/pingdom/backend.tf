terraform {
  backend "gcs" {
    bucket = "galactus-nlamirault"
    prefix = "monitoring/pingdom/lamirault.tfstate"
  }
}
