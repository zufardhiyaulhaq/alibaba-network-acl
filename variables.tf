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

# variable "additional_ingress_public_rules" {
#   description = "List of additional ingress rules for public network ACL"
#   type        = list(object({
#     rule_number   = number
#     protocol      = string
#     rule_action   = string
#     cidr_block    = string
#     from_port     = number
#     to_port       = number
#   }))
# }