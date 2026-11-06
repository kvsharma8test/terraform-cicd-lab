variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "cicd-lab"
}
 
variable "environment" {
  description = "Target environment"
  type        = string
  default     = "dev"
 
  validation {
    condition     = contains(["dev", "test", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, test, staging, prod."
  }
}

