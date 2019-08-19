terraform {
  backend "gcs" {
    bucket = "galactus-nlamirault"
    prefix = "projects/nlamirault/speedtest_exporter/gitlab.tfstate"
  }
}
