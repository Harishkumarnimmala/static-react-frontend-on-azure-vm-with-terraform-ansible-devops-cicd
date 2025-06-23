
# React App Deployment to Azure VM using Terraform and Ansible

This repository contains infrastructure and automation code to deploy a React application on an Azure Virtual Machine using Terraform for provisioning and Ansible for configuration management.

## Overview

The deployment process involves the following:

1. Provisioning Azure infrastructure using Terraform.
2. Configuring the VM and deploying the React application using Ansible.
3. Serving the static build with `serve` on port 3000.

## Folder Structure

```
react-devops-automation/
├── ansible/
│   ├── inventory.ini
│   ├── react-deploy.yaml
│   └── files/                 # Build files will be copied here before transfer
├── react-app/
│   ├── public/
│   ├── src/
│   ├── build/                 # Created after build step
│   ├── package.json
│   └── ...
├── pipelines/
│   ├── ci.yml                 # Builds and publishes React app
│   └── cd.yml                 # Deploys to Azure VM using Ansible
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   └── ...
├── README.md
└── .gitignore

```

## Prerequisites

- Azure CLI installed and logged in
- Terraform >= 1.5
- Ansible >= 2.14
- SSH key pair configured (`~/.ssh/id_rsa` and `~/.ssh/id_rsa.pub`)
- React app must be built using `npm run build` and placed inside `react-app/build/`

## Terraform Instructions

1. Navigate to the `terraform` directory.
2. Initialize and apply the Terraform configuration:

```bash
cd terraform
terraform init
terraform apply
```

3. After successful provisioning, note the public IP output.

## Ansible Deployment

1. Update `ansible/inventory.ini` with the public IP of the VM:

```
[react-vm]
<VM_PUBLIC_IP> ansible_user=azureuser ansible_ssh_private_key_file=~/.ssh/id_rsa
```

2. Ensure the React app is built:

```bash
cd react-app
npm install
npm run build
```

3. Run the Ansible playbook:

```bash
cd ansible
ansible-playbook -i inventory.ini react-deploy.yaml
```

## Access the Application

Once the playbook runs successfully, the app will be accessible at:

```
http://<VM_PUBLIC_IP>:3000
```

## Notes

- The VM is configured with a static public IP and port 22/3000 open via NSG.
- SSH access is via public key authentication only.
- Node.js and `serve` are installed on the VM by the Ansible playbook.
- Any app changes require a rebuild and re-run of the Ansible playbook.

## Clean Up

To destroy all resources:

```bash
cd terraform
terraform destroy
```

## Author

Harish Kumar Nimmala  
Infrastructure and Deployment Automation – Azure | Terraform | Ansible

# Ansible command to run our playbook
ansible-playbook -i inventory.ini react-deploy.yaml

# Clean terraform cache always after terraform destroy
rm -rf .terraform terraform.tfstate terraform.tfstate.backup
rm -f .terraform.lock.hcl


