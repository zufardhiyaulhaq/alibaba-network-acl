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
  type = list(string)
}

variable "utility_subnets_cidr" {
  description = "List of utility subnets CIDR"
  type = list(string)
}

variable "application_subnets_cidr" {
  description = "List of application subnets CIDR"
  type = list(string)
}

variable "stateful_subnets_cidr" {
  description = "List of stateful subnets CIDR"
  type = list(string)
}

variable "compliance_subnets_cidr" {
  description = "List of compliance subnets CIDR"
  type = list(string)
}

variable "public_subnets_id" {
  description = "List of public subnets ID"
  type = list(string)
}

variable "utility_subnets_id" {
  description = "List of utility subnets ID"
  type = list(string)
}

variable "application_subnets_id" {
  description = "List of application subnets ID"
  type = list(string)
}

variable "stateful_subnets_id" {
  description = "List of stateful subnets ID"
  type = list(string)
}

variable "compliance_subnets_id" {
  description = "List of compliance subnets ID"
  type = list(string)
}

resource "tencentcloud_vpc_acl" "public" {
  vpc_id = var.vpc_id
  name   = "public-network-acl"
  ingress = []
  egress = [
    "ACCEPT#0.0.0.0/0#ALL#ALL",
  ]

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "tencentcloud_vpc_acl_attachment" "public" {
  for_each = var.public_subnets_id

  acl_id    = tencentcloud_vpc_acl.public.id
  subnet_id = each.value
}

resource "tencentcloud_vpc_acl" "utility" {
  vpc_id = var.vpc_id
  name   = "utility-network-acl"
  ingress = []
  egress = [
    "ACCEPT#0.0.0.0/0#ALL#ALL",
  ]

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "tencentcloud_vpc_acl_attachment" "utility" {
  for_each = var.utility_subnets_id

  acl_id    = tencentcloud_vpc_acl.utility.id
  subnet_id = each.value
}

resource "tencentcloud_vpc_acl" "application" {
  vpc_id = var.vpc_id
  name   = "application-network-acl"
  ingress = []
  egress = [
    "ACCEPT#0.0.0.0/0#ALL#ALL",
  ]

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "tencentcloud_vpc_acl_attachment" "application" {
  for_each = var.application_subnets_id

  acl_id    = tencentcloud_vpc_acl.application.id
  subnet_id = each.value
}


resource "tencentcloud_vpc_acl" "stateful" {
  vpc_id = var.vpc_id
  name   = "stateful-network-acl"
  ingress = []
  egress = [
    "ACCEPT#0.0.0.0/0#ALL#ALL",
  ]

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "tencentcloud_vpc_acl_attachment" "stateful" {
  for_each = var.stateful_subnets_id

  acl_id    = tencentcloud_vpc_acl.stateful.id
  subnet_id = each.value
}


resource "tencentcloud_vpc_acl" "compliance" {
  vpc_id = var.vpc_id
  name   = "compliance-network-acl"
  ingress = []
  egress = [
    "ACCEPT#0.0.0.0/0#ALL#ALL",
  ]

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "tencentcloud_vpc_acl_attachment" "compliance" {
  for_each = var.compliance_subnets_id

  acl_id    = tencentcloud_vpc_acl.compliance.id
  subnet_id = each.value
}
