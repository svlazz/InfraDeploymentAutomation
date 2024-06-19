
# Automatización de Despliegue con Ansible y Terraform

Este proyecto está diseñado para automatizar el despliegue de una infraestructura y aplicaciones utilizando Ansible y Terraform.

## Estructura del Proyecto

- `.gitignore`: Define los archivos y directorios que deben ser ignorados por Git.
- `README.md`: Documento de introducción y guía del proyecto.
- `pi_ansible/`: Contiene todos los playbooks y configuraciones de Ansible.
  - `inventory.yaml`: Archivo de inventario de Ansible.
  - `project_deployment.yml`: Playbook principal para el despliegue del proyecto.
  - `tasks/`: Contiene las tareas específicas de Ansible divididas en subdirectorios:
    - `galera/`: Scripts y configuraciones para la instalación de Galera Cluster.
      - `creation.sql`
      - `galera-installation.yml`
      - `galera.cnf`
      - `galera2.cnf`
      - `ini_galera.sh`
    - `k8s/`: Configuraciones y scripts para la instalación y despliegue en Kubernetes.
      - `argocd-application.yaml`
      - `cluster_creation.yaml`
      - `deploy_app.yaml`
      - `install-argocd.yaml`
      - `install_grafana.yml`
      - `join_cluster.yaml`
      - `k8s_installation.yaml`
      - `urltopdf_configmap.yml`
    - `proxy/`: Configuraciones para la instalación del proxy.
      - `haproxy.cfg`
      - `proxy_installation.yaml`
  - `templates/`: Plantillas utilizadas por Ansible.
    - `galera.j2`
- `pi_tf/`: Contiene los archivos de configuración de Terraform.
  - `galera.tpl`
  - `galera2.tpl`
  - `inventory.tpl`
  - `main.tf`
  - `proxy.tpl`
  - `urltopdf_configmap.tpl`

## Requisitos

- Ansible 2.9+
- Terraform 0.12+
- Acceso a una infraestructura compatible con los scripts y configuraciones del proyecto.

## Uso

### Despliegue con Ansible

1. Configura tu inventario en `pi_ansible/inventory.yaml`.
2. Ejecuta el playbook principal:
   ```bash
   ansible-playbook pi_ansible/project_deployment.yml
   ```

### Despliegue con Terraform

1. Ajusta las configuraciones necesarias en los archivos `.tpl` en el directorio `pi_tf`.
2. Inicializa y aplica la configuración de Terraform:
   ```bash
   cd pi_tf
   terraform init
   terraform apply
   ```

## Contribuciones

Si deseas contribuir a este proyecto, por favor realiza un fork del repositorio y envía un pull request con tus mejoras.

---