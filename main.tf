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

provider "aws" {
  region = var.aws_region
}

provider "vault" {
  # Configuration options
}

data "aws_secretsmanager_secret" "mysecret" {
  for_each = toset(var.secret_names)
  name     = each.value
}

data "aws_secretsmanager_secret_version" "mysecret" {
  for_each = toset(var.secret_names)
  secret_id = data.aws_secretsmanager_secret.mysecret[each.value].id
}

resource "vault_generic_secret" "developer_sample_data" {
  for_each = toset(var.secret_names)
  path = "${var.vault_kv_path}/${each.value}"

  data_json = data.aws_secretsmanager_secret_version.mysecret[each.value].secret_string
}
