# Overview

A Terraform module to Migrate AWS Secrets Manager secrets to HashiCorp Vault's KV secrets engine. Please note that this only works for Key/Value pair in AWS Secrets Manager and not Plaintext.

## Test locally

#!/usr/bin/bash
export VAULT_ADDR=https://
export VAULT_TOKEN=
export VAULT_CACERT="ca.pem"
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_SESSION_TOKEN=

terraform apply --auto-approve