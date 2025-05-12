# K3s Alpine Linux Cluster Setup

This project contains Ansible playbooks for setting up a K3s Kubernetes cluster on Alpine Linux.

## Requirements

- Ansible 2.9 or newer
- Access to Alpine Linux machines
- SSH keys set up for passwordless authentication to the machines

## Setup

1. Update the inventory file at `inventory/hosts.ini` with your server IPs and user information.

2. Create a vault file with your sudo password:

```bash
# Replace 'your_sudo_password' with the actual password
./scripts/create-vault.sh your_sudo_password
```

3. Create a vault password file for convenient playbook execution:

```bash
# Replace 'your_vault_password' with the password you'll use to encrypt the vault
./scripts/create-vault-file.sh your_vault_password
```

## Running the Playbook

Run the K3s installation playbook:

```bash
ansible-playbook playbooks/k3s-alpine.yml --vault-password-file .vault_pass
```

Or if you prefer to enter the vault password manually:

```bash
ansible-playbook playbooks/k3s-alpine.yml --ask-vault-pass
```

## Accessing the Cluster

After installation, the kubeconfig file will be downloaded to the current directory as `kubeconfig`. Use it with kubectl:

```bash
export KUBECONFIG=./kubeconfig
kubectl get nodes
```

## Architecture

- `masters` - K3s server nodes
- `workers` - K3s agent nodes

## Variables

- `k3s_version` - Version of K3s to install
- `k3s_server_ip` - IP address of the master server
- `ansible_become_pass` - Password for sudo privileges (stored in vault)
