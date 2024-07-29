resource "alicloud_network_acl" "application" {
  vpc_id           = var.vpc_id
  network_acl_name = "application"

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }

  dynamic "ingress_acl_entries" {
    for_each = toset(var.application_subnets_cidr)
    content {
      protocol               = "all"
      port                   = "-1/-1"
      source_cidr_ip         = ingress_acl_entries.value
      network_acl_entry_name = "allow_all_port_from_application_subnet"
      entry_type             = "custom"
      policy                 = "accept"
      description            = "allow all port from application subnet"
    }
  }

  dynamic "ingress_acl_entries" {
    for_each = toset(var.utility_subnets_cidr)
    content {
      protocol               = "all"
      port                   = "22/22"
      source_cidr_ip         = ingress_acl_entries.value
      network_acl_entry_name = "allow_22_from_utility_subnet"
      entry_type             = "custom"
      policy                 = "accept"
      description            = "allow 22 from utility subnet"
    }
  }

  dynamic "ingress_acl_entries" {
    for_each = toset(var.utility_subnets_cidr)
    content {
      protocol               = "all"
      port                   = "3022/3022"
      source_cidr_ip         = ingress_acl_entries.value
      network_acl_entry_name = "allow_3022_from_utility_subnet"
      entry_type             = "custom"
      policy                 = "accept"
      description            = "allow 3022 from utility subnet"
    }
  }

  dynamic "ingress_acl_entries" {
    for_each = var.additional_ingress_application_rules
    content {
      protocol               = ingress_acl_entries.value.protocol
      port                   = ingress_acl_entries.value.port
      source_cidr_ip         = ingress_acl_entries.value.source_cidr_ip
      network_acl_entry_name = ingress_acl_entries.value.name
      entry_type             = "custom"
      policy                 = ingress_acl_entries.value.policy
      description            = ingress_acl_entries.value.name
    }
  }
}

resource "alicloud_network_acl_attachment" "application" {
  network_acl_id = alicloud_network_acl.application.id

  dynamic "resources" {
    for_each = toset(var.application_subnets_id)
    content {
      resource_id   = resources.value
      resource_type = "VSwitch"
    }
  }
}