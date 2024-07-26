resource "alicloud_network_acl" "application" {
  vpc_id           = var.vpc_id
  network_acl_name = "application"

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "alicloud_network_acl_attachment" "application" {
  for_each = toset(var.application_subnets_id)

  network_acl_id = alicloud_network_acl.application.id
  resources {
    resource_id   = each.value
    resource_type = "VSwitch"
  }
}

resource "alicloud_network_acl_entries" "application" {
  for_each = toset(var.application_subnets_cidr)

  network_acl_id = alicloud_network_acl.application.id

  dynamic "ingress" {
    for_each = toset(var.application_subnets_cidr)
    content {
      protocol       = "all"
      port           = "-1/-1"
      source_cidr_ip = each.value
      name           = "allow_all_port_from_application_subnet"
      entry_type     = "custom"
      policy         = "accept"
      description    = "allow all port from application subnet"
    }
  }

  dynamic "ingress" {
    for_each = toset(var.utility_subnets_cidr)
    content {
      protocol       = "all"
      port           = "22/22"
      source_cidr_ip = each.value
      name           = "allow_22_from_utility_subnet"
      entry_type     = "custom"
      policy         = "accept"
      description    = "allow 22 from utility subnet"
    }
  }

  dynamic "ingress" {
    for_each = toset(var.utility_subnets_cidr)
    content {
      protocol       = "all"
      port           = "3022/3022"
      source_cidr_ip = each.value
      name           = "allow_3022_from_utility_subnet"
      entry_type     = "custom"
      policy         = "accept"
      description    = "allow 3022 from utility subnet"
    }
  }

  dynamic "ingress" {
    for_each = toset(var.utility_subnets_cidr)
    content {
      protocol       = "all"
      port           = "6443/6443"
      source_cidr_ip = each.value
      name           = "allow_6443_from_utility_subnet"
      entry_type     = "custom"
      policy         = "accept"
      description    = "allow 6443 from utility subnet"
    }
  }
}