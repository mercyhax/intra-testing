#!/bin/bash
# Script to create a vault password file

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <vault-password>"
    exit 1
fi

# Create the vault password file
echo "$1" > .vault_pass
chmod 600 .vault_pass

echo "Vault password file created at .vault_pass"
echo "You can now run the playbook with: ansible-playbook playbooks/k3s-alpine.yml --vault-password-file .vault_pass" 