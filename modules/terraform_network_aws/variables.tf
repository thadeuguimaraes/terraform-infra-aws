variable "owner" {
  description = "Nome do time responsável"
  type        = string
}

variable "environment" {
  description = "Sigla do ambiente correspondente a implantação"
  type        = string
}

variable "region" {
  description = "Id da região que os recursos serão provisionados"
  type        = string
}