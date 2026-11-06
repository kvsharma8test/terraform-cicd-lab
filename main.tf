terraform {
  required_version = ">= 1.6.0"
 
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}
 
# Generates a random, readable "server" name, e.g. "brave-otter"
resource "random_pet" "server" {
  length = 2
}
 
# Our "infrastructure": a config file written to disk
resource "local_file" "app_config" {
  filename = "${path.module}/output/${var.environment}-app.txt"
  content  = <<-EOT
    Application : ${var.app_name}
    Environment : ${var.environment}
    Server name : ${random_pet.server.id}
  EOT
}

