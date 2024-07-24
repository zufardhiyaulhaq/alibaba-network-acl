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