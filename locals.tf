locals {
  common_tags = {
    environment = "Production"
    location    = "Bangalore"
    org         = "TPE"
  }
  special_tags = {
    environment = "MalifeMaRulz"
    location    = "Heaven"
    org         = "BestPlaceToWork"
  }
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

#locals conecpt demonstrated below. Note: While defining block, we define as locals (with s). But while calling it is only local
