# AWS region and AZs in which to deploy
variable "aws_region" {
  description = "AWS region where the secrets live"
  type        = string
  default     = "us-east-1"
}

variable "secret_names" {
  description = "Migrate these secrets from AWS secrets manager to Vault. These are the names of the secrets in AWS Secrets Manager"
  type        = list(string)
}

variable "vault_kv_path" {
  description = "The path in the KV secrets engine, don't append a forward slash / "
  type        = string
  default     = "kv"
}
