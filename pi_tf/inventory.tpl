k8s:
  hosts:
    master:
      ansible_host: ${ec2_master_global_dns}
    worker1:
      ansible_host: ${ec2_worker1_global_dns}
    worker2:
      ansible_host: ${ec2_worker2_global_dns}
  vars:
    ansible_user: ubuntu
    master_ip: ${private_ip_master}
bdgroup:
  hosts:
    galera1:
      ansible_host: ${ec2_galera1_global_dns}
    galera2:
      ansible_host: ${ec2_galera2_global_dns}
  vars:
    ansible_user: ubuntu
haproxy:
  hosts:
    proxy:
      ansible_host: ${ec2_haproxy_global_dns}
  vars:
    ansible_user: ubuntu