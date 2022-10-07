# Overview

A Terraform module to Migrate AWS Secrets Manager secrets to HashiCorp Vault's KV secrets engine. Please note that this only works for Key/Value pair in AWS Secrets Manager and not Plaintext. The migration is a copy and not a move function. The secrets will remain in AWS Secrets Manager.

## DISCLAIMER

The secrets migrated will appear in Terraform's state file. Protect this state file accordingly.

## To Use this Module:

You can find an [example in this repo.](https://github.com/samgabrail/aws-secrets-manager-migration-to-vault)

or simply do the following:

create a `main.tf` file with this content:
```bash
terraform {
  required_version = ">= 0.15"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.34.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.9.1"
    }
  }
}

module "secretsmanager-to-vault-migration" {
  source  = "samgabrail/secretsmanager-to-vault-migration/vault"
  version = "0.0.4" # use the latest version or pin a version
  # insert at least the 1 required variable here
  secret_names     = ["samg-migration-vault", "samg-migration-vault2"]
}
```

and an optional `outputs.tf` file with this content:
```bash
output "message" {
  description = "Success Message"
  value       = "Successfully copied over secrets from AWS Secrets Manager to HashiCorp Vault! Here are the secret names and paths below:"
}

output "secrets_in_vault" {
  description = "Names and paths of Secrets in Vault"
  value = module.secretsmanager-to-vault-migration.secrets_in_vault
}
```

and an optional `variables.tf` file.
