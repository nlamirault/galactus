terraform {
  backend "gcs" {
    bucket = "galactus-nlamirault"
    prefix = "monitoring/statuscake/lamirault.tfstate"
  }
}
