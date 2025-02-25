variable "label_environment" {
  description = "Enviroment label"
  type        = string
}

variable "label_team" {
  description = "Team label"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "public_subnets_cidr" {
  description = "List of public subnets CIDR"
  type        = list(string)
}

variable "utility_subnets_cidr" {
  description = "List of utility subnets CIDR"
  type        = list(string)
}

variable "application_subnets_cidr" {
  description = "List of application subnets CIDR"
  type        = list(string)
}

variable "stateful_subnets_cidr" {
  description = "List of stateful subnets CIDR"
  type        = list(string)
}

variable "compliance_subnets_cidr" {
  description = "List of compliance subnets CIDR"
  type        = list(string)
}

variable "public_subnets_id" {
  description = "List of public subnets ID"
  type        = list(string)
}

variable "utility_subnets_id" {
  description = "List of utility subnets ID"
  type        = list(string)
}

variable "application_subnets_id" {
  description = "List of application subnets ID"
  type        = list(string)
}

variable "stateful_subnets_id" {
  description = "List of stateful subnets ID"
  type        = list(string)
}

variable "compliance_subnets_id" {
  description = "List of compliance subnets ID"
  type        = list(string)
}

variable "additional_ingress_application_rules" {
  description = "List of additional ingress rules for application subnet ACL"
  type = map(object({
    policy         = string
    protocol       = string
    port           = string
    source_cidr_ip = string
  }))
  default = {}
}

variable "additional_ingress_utility_rules" {
  description = "List of additional ingress rules for utility subnet ACL"
  type = map(object({
    policy         = string
    protocol       = string
    port           = string
    source_cidr_ip = string
  }))
  default = {}
}

variable "additional_ingress_public_rules" {
  description = "List of additional ingress rules for public subnet ACL"
  type = map(object({
    policy         = string
    protocol       = string
    port           = string
    source_cidr_ip = string
  }))
  default = {}
}

variable "additional_ingress_stateful_rules" {
  description = "List of additional ingress rules for stateful subnet ACL"
  type = map(object({
    policy         = string
    protocol       = string
    port           = string
    source_cidr_ip = string
  }))
  default = {}
}

variable "additional_ingress_compliance_rules" {
  description = "List of additional ingress rules for compliance subnet ACL"
  type = map(object({
    policy         = string
    protocol       = string
    port           = string
    source_cidr_ip = string
  }))
  default = {}
}