#!/bin/bash
# Script to create a new vault file with the correct variable

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <sudo-password>"
    exit 1
fi

# Create temporary file with the password
cat > temp_vault.yml << EOF
---
vault_ansible_become_pass: "$1"
EOF

# Encrypt the file
ansible-vault encrypt temp_vault.yml --output group_vars/all/vault.yml

# Clean up
rm temp_vault.yml

echo "Vault file created at group_vars/all/vault.yml with the correct variable" 