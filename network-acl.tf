resource "alicloud_network_acl" "application" {
  vpc_id           = var.vpc_id
  network_acl_name = "application"

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }

  egress_acl_entries {
    protocol               = "all"
    port                   = "-1/-1"
    destination_cidr_ip    = "0.0.0.0/0"
    network_acl_entry_name = "allow_all_port"
    entry_type             = "custom"
    policy                 = "accept"
    description            = "allow all port"
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
      protocol               = "tcp"
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
      protocol               = "tcp"
      port                   = "3022/3022"
      source_cidr_ip         = ingress_acl_entries.value
      network_acl_entry_name = "allow_3022_from_utility_subnet"
      entry_type             = "custom"
      policy                 = "accept"
      description            = "allow 3022 from utility subnet"
    }
  }

  dynamic "ingress_acl_entries" {
    for_each = toset(var.utility_subnets_cidr)
    content {
      protocol               = "tcp"
      port                   = "6443/6443"
      source_cidr_ip         = ingress_acl_entries.value
      network_acl_entry_name = "allow_6443_from_utility_subnet"
      entry_type             = "custom"
      policy                 = "accept"
      description            = "allow 6443 from utility subnet"
    }
  }

  dynamic "ingress_acl_entries" {
    for_each = toset(var.public_subnets_cidr)
    content {
      protocol               = "tcp"
      port                   = "80/80"
      source_cidr_ip         = ingress_acl_entries.value
      network_acl_entry_name = "allow_80_from_public_subnet"
      entry_type             = "custom"
      policy                 = "accept"
      description            = "allow 6443 from public subnet"
    }
  }

  dynamic "ingress_acl_entries" {
    for_each = toset(var.public_subnets_cidr)
    content {
      protocol               = "tcp"
      port                   = "443/443"
      source_cidr_ip         = ingress_acl_entries.value
      network_acl_entry_name = "allow_443_from_public_subnet"
      entry_type             = "custom"
      policy                 = "accept"
      description            = "allow 443 from public subnet"
    }
  }

  dynamic "ingress_acl_entries" {
    for_each = toset(var.public_subnets_cidr)
    content {
      protocol               = "tcp"
      port                   = "15021/15021"
      source_cidr_ip         = ingress_acl_entries.value
      network_acl_entry_name = "allow_15021_from_public_subnet"
      entry_type             = "custom"
      policy                 = "accept"
      description            = "allow 15021 from public subnet"
    }
  }

  dynamic "ingress_acl_entries" {
    for_each = toset(var.public_subnets_cidr)
    content {
      protocol               = "tcp"
      port                   = "15443/15443"
      source_cidr_ip         = ingress_acl_entries.value
      network_acl_entry_name = "allow_15443_from_public_subnet"
      entry_type             = "custom"
      policy                 = "accept"
      description            = "allow 15443 from public subnet"
    }
  }

  dynamic "ingress_acl_entries" {
    for_each = var.additional_ingress_application_rules
    content {
      protocol               = ingress_acl_entries.value.protocol
      port                   = ingress_acl_entries.value.port
      source_cidr_ip         = ingress_acl_entries.value.source_cidr_ip
      network_acl_entry_name = ingress_acl_entries.key
      entry_type             = "custom"
      policy                 = ingress_acl_entries.value.policy
      description            = ingress_acl_entries.key
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

resource "alicloud_network_acl" "utility" {
  vpc_id           = var.vpc_id
  network_acl_name = "utility"

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }

  egress_acl_entries {
    protocol               = "all"
    port                   = "-1/-1"
    destination_cidr_ip    = "0.0.0.0/0"
    network_acl_entry_name = "allow_all_port"
    entry_type             = "custom"
    policy                 = "accept"
    description            = "allow all port"
  }

  dynamic "ingress_acl_entries" {
    for_each = toset(var.utility_subnets_cidr)
    content {
      protocol               = "all"
      port                   = "-1/-1"
      source_cidr_ip         = ingress_acl_entries.value
      network_acl_entry_name = "allow_all_port_from_utility_subnet"
      entry_type             = "custom"
      policy                 = "accept"
      description            = "allow all port from utility subnet"
    }
  }

  dynamic "ingress_acl_entries" {
    for_each = var.additional_ingress_utility_rules
    content {
      protocol               = ingress_acl_entries.value.protocol
      port                   = ingress_acl_entries.value.port
      source_cidr_ip         = ingress_acl_entries.value.source_cidr_ip
      network_acl_entry_name = ingress_acl_entries.key
      entry_type             = "custom"
      policy                 = ingress_acl_entries.value.policy
      description            = ingress_acl_entries.key
    }
  }
}

resource "alicloud_network_acl_attachment" "utility" {
  network_acl_id = alicloud_network_acl.utility.id

  dynamic "resources" {
    for_each = toset(var.utility_subnets_id)
    content {
      resource_id   = resources.value
      resource_type = "VSwitch"
    }
  }
}

resource "alicloud_network_acl" "public" {
  vpc_id           = var.vpc_id
  network_acl_name = "public"

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }

  egress_acl_entries {
    protocol               = "all"
    port                   = "-1/-1"
    destination_cidr_ip    = "0.0.0.0/0"
    network_acl_entry_name = "allow_all_port"
    entry_type             = "custom"
    policy                 = "accept"
    description            = "allow all port"
  }

  dynamic "ingress_acl_entries" {
    for_each = toset(var.public_subnets_cidr)
    content {
      protocol               = "all"
      port                   = "-1/-1"
      source_cidr_ip         = ingress_acl_entries.value
      network_acl_entry_name = "allow_all_port_from_public_subnet"
      entry_type             = "custom"
      policy                 = "accept"
      description            = "allow all port from public subnet"
    }
  }

  dynamic "ingress_acl_entries" {
    for_each = toset(var.utility_subnets_cidr)
    content {
      protocol               = "tcp"
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
      protocol               = "tcp"
      port                   = "3022/3022"
      source_cidr_ip         = ingress_acl_entries.value
      network_acl_entry_name = "allow_3022_from_utility_subnet"
      entry_type             = "custom"
      policy                 = "accept"
      description            = "allow 3022 from utility subnet"
    }
  }

  dynamic "ingress_acl_entries" {
    for_each = var.additional_ingress_public_rules
    content {
      protocol               = ingress_acl_entries.value.protocol
      port                   = ingress_acl_entries.value.port
      source_cidr_ip         = ingress_acl_entries.value.source_cidr_ip
      network_acl_entry_name = ingress_acl_entries.key
      entry_type             = "custom"
      policy                 = ingress_acl_entries.value.policy
      description            = ingress_acl_entries.key
    }
  }
}

resource "alicloud_network_acl_attachment" "public" {
  network_acl_id = alicloud_network_acl.public.id

  dynamic "resources" {
    for_each = toset(var.public_subnets_id)
    content {
      resource_id   = resources.value
      resource_type = "VSwitch"
    }
  }
}

resource "alicloud_network_acl" "stateful" {
  vpc_id           = var.vpc_id
  network_acl_name = "stateful"

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }

  egress_acl_entries {
    protocol               = "all"
    port                   = "-1/-1"
    destination_cidr_ip    = "0.0.0.0/0"
    network_acl_entry_name = "allow_all_port"
    entry_type             = "custom"
    policy                 = "accept"
    description            = "allow all port"
  }

  dynamic "ingress_acl_entries" {
    for_each = toset(var.stateful_subnets_cidr)
    content {
      protocol               = "all"
      port                   = "-1/-1"
      source_cidr_ip         = ingress_acl_entries.value
      network_acl_entry_name = "allow_all_port_from_stateful_subnet"
      entry_type             = "custom"
      policy                 = "accept"
      description            = "allow all port from stateful subnet"
    }
  }

  dynamic "ingress_acl_entries" {
    for_each = toset(var.utility_subnets_cidr)
    content {
      protocol               = "tcp"
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
      protocol               = "tcp"
      port                   = "3022/3022"
      source_cidr_ip         = ingress_acl_entries.value
      network_acl_entry_name = "allow_3022_from_utility_subnet"
      entry_type             = "custom"
      policy                 = "accept"
      description            = "allow 3022 from utility subnet"
    }
  }

  dynamic "ingress_acl_entries" {
    for_each = var.additional_ingress_stateful_rules
    content {
      protocol               = ingress_acl_entries.value.protocol
      port                   = ingress_acl_entries.value.port
      source_cidr_ip         = ingress_acl_entries.value.source_cidr_ip
      network_acl_entry_name = ingress_acl_entries.key
      entry_type             = "custom"
      policy                 = ingress_acl_entries.value.policy
      description            = ingress_acl_entries.key
    }
  }
}

resource "alicloud_network_acl_attachment" "stateful" {
  network_acl_id = alicloud_network_acl.stateful.id

  dynamic "resources" {
    for_each = toset(var.stateful_subnets_id)
    content {
      resource_id   = resources.value
      resource_type = "VSwitch"
    }
  }
}

resource "alicloud_network_acl" "compliance" {
  vpc_id           = var.vpc_id
  network_acl_name = "compliance"

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }

  egress_acl_entries {
    protocol               = "all"
    port                   = "-1/-1"
    destination_cidr_ip    = "0.0.0.0/0"
    network_acl_entry_name = "allow_all_port"
    entry_type             = "custom"
    policy                 = "accept"
    description            = "allow all port"
  }

  dynamic "ingress_acl_entries" {
    for_each = toset(var.compliance_subnets_cidr)
    content {
      protocol               = "all"
      port                   = "-1/-1"
      source_cidr_ip         = ingress_acl_entries.value
      network_acl_entry_name = "allow_all_port_from_compliance_subnet"
      entry_type             = "custom"
      policy                 = "accept"
      description            = "allow all port from compliance subnet"
    }
  }

  dynamic "ingress_acl_entries" {
    for_each = toset(var.utility_subnets_cidr)
    content {
      protocol               = "tcp"
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
      protocol               = "tcp"
      port                   = "3022/3022"
      source_cidr_ip         = ingress_acl_entries.value
      network_acl_entry_name = "allow_3022_from_utility_subnet"
      entry_type             = "custom"
      policy                 = "accept"
      description            = "allow 3022 from utility subnet"
    }
  }

  dynamic "ingress_acl_entries" {
    for_each = var.additional_ingress_compliance_rules
    content {
      protocol               = ingress_acl_entries.value.protocol
      port                   = ingress_acl_entries.value.port
      source_cidr_ip         = ingress_acl_entries.value.source_cidr_ip
      network_acl_entry_name = ingress_acl_entries.key
      entry_type             = "custom"
      policy                 = ingress_acl_entries.value.policy
      description            = ingress_acl_entries.key
    }
  }
}

resource "alicloud_network_acl_attachment" "compliance" {
  network_acl_id = alicloud_network_acl.compliance.id

  dynamic "resources" {
    for_each = toset(var.compliance_subnets_id)
    content {
      resource_id   = resources.value
      resource_type = "VSwitch"
    }
  }
}