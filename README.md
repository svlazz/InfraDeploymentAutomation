# ANSIBLE & TERRAFORM FILES

### ANSIBLE FILES
1. k8s_installation.yaml: Playbook encargado de instalar Kubernetes en las instancias EC2
2. cluster_creation.yaml: Playbook encargado de crear el cluster de Kubernetes
3. join_cluster.yaml: Unión de los nodos trabajadores al cluster
4. install_argocd.yaml: Instalación de ArgoCD en Kubernetes
5. deploy_app.yaml: Despliegue de la aplicación de ArgoCD
	1. argocd-application.yaml: Archivo YAML para la creación de la aplicación en ArgoCD
6. galera-installation.yml: Instalación de Galera y MariaDB en las instancias EC2
	1. galeraX.cnf: Archivo encargado de unir los nodos al cluster de galera
	2. creation.sql: Script de SQL para la creación de las tablas
7. proxy_installation.yaml: Playbook que instala haproxy y Redis
		1. haproxy.cfg: Archivo de configuración de Haproxy

### TERRAFORM FILES
