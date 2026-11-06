output "server_name" {
  description = "Randomly generated server name"
  value       = random_pet.server.id
}

output "config_file" {
  description = "Path of the generated config file"
  value       = local_file.app_config.filename
}

