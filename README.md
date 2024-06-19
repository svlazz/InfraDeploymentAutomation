# Deployment Automation with Ansible and Terraform

This project is designed to automate the deployment of infrastructure and applications using Ansible and Terraform.

## Project Structure

- `.gitignore`: Defines files and directories that should be ignored by Git.
- `README.md`: Introduction document and project guide.
- `pi_ansible/`: Contains all Ansible playbooks and configurations.
  - `inventory.yaml`: Ansible inventory file.
  - `project_deployment.yml`: Main playbook for project deployment.
  - `tasks/`: Contains specific Ansible tasks divided into subdirectories:
    - `galera/`: Scripts and configurations for Galera Cluster installation.
      - `creation.sql`
      - `galera-installation.yml`
      - `galera.cnf`
      - `galera2.cnf`
      - `ini_galera.sh`
    - `k8s/`: Configurations and scripts for Kubernetes installation and deployment.
      - `argocd-application.yaml`
      - `cluster_creation.yaml`
      - `deploy_app.yaml`
      - `install-argocd.yaml`
      - `install_grafana.yml`
      - `join_cluster.yaml`
      - `k8s_installation.yaml`
      - `urltopdf_configmap.yml`
    - `proxy/`: Configurations for proxy installation.
      - `haproxy.cfg`
      - `proxy_installation.yaml`
  - `templates/`: Templates used by Ansible.
    - `galera.j2`
- `pi_tf/`: Contains Terraform configuration files.
  - `galera.tpl`
  - `galera2.tpl`
  - `inventory.tpl`
  - `main.tf`
  - `proxy.tpl`
  - `urltopdf_configmap.tpl`

## Requirements

- Ansible 2.9+
- Terraform 0.12+
- Access to an infrastructure compatible with the project's scripts and configurations.

## Usage

### Deployment with Ansible

1. Configure your inventory in `pi_ansible/inventory.yaml`.
2. Execute the main playbook:
   ```bash
   ansible-playbook pi_ansible/project_deployment.yml
   ```

### Deployment with Terraform

1. Adjust necessary configurations in `.tpl` files in the `pi_tf` directory.
2. Initialize and apply Terraform configuration:
   ```bash
   cd pi_tf
   terraform init
   terraform apply
   ```

## Contributions

If you wish to contribute to this project, please fork the repository and submit a pull request with your improvements.

---

## Contribuciones

Si deseas contribuir a este proyecto, por favor realiza un fork del repositorio y envía un pull request con tus mejoras.

---
