locals {
  env     = terraform.workspace == "default" ? "dev" : terraform.workspace
  owner   = "Cloud"
  product = "produtox"
  service = "servicex"
}