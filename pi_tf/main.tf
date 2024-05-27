provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "master_node" {
    ami = "ami-0cd59ecaf368e5ccf"
    instance_type = "t3.small"
    key_name = aws_key_pair.s4lazz_key.key_name
    vpc_security_group_ids = [
      aws_security_group.k8s-cluster-sg.id
    ]
    root_block_device {
      volume_type           = "gp2"  # Tipo de volumen EBS (por ejemplo, gp2, io1, st1, sc1, standard)
      volume_size           = 25     # Tamaño del volumen en GB
      delete_on_termination = true   # Eliminar el volumen cuando se termine la instancia
    }
    tags = {
      Name = "master_node"
    }
}

resource "aws_instance" "worker1_node" {
    ami = "ami-0cd59ecaf368e5ccf"
    instance_type = "t3.small"
    key_name = aws_key_pair.s4lazz_key.key_name
    vpc_security_group_ids = [
      aws_security_group.k8s-cluster-sg.id
    ]
    root_block_device {
      volume_type           = "gp2"  # Tipo de volumen EBS (por ejemplo, gp2, io1, st1, sc1, standard)
      volume_size           = 25     # Tamaño del volumen en GB
      delete_on_termination = true   # Eliminar el volumen cuando se termine la instancia
    }
    tags = {
      Name = "worker1_node"
    }
}


resource "aws_instance" "worker2_node" {
    ami = "ami-0cd59ecaf368e5ccf"
    instance_type = "t3.small"
    key_name = aws_key_pair.s4lazz_key.key_name
    vpc_security_group_ids = [
      aws_security_group.k8s-cluster-sg.id
    ]
    root_block_device {
      volume_type           = "gp2"  # Tipo de volumen EBS (por ejemplo, gp2, io1, st1, sc1, standard)
      volume_size           = 25     # Tamaño del volumen en GB
      delete_on_termination = true   # Eliminar el volumen cuando se termine la instancia
    }
    tags = {
      Name = "worker2_node"
    }
}

resource "aws_instance" "galera1" {
    ami = "ami-0cd59ecaf368e5ccf"
    instance_type = "t3.small"
    key_name = aws_key_pair.s4lazz_key.key_name
    vpc_security_group_ids = [
      aws_security_group.galera-cluster-sg.id
    ]
    root_block_device {
      volume_type           = "gp2"  # Tipo de volumen EBS (por ejemplo, gp2, io1, st1, sc1, standard)
      volume_size           = 25     # Tamaño del volumen en GB
      delete_on_termination = true   # Eliminar el volumen cuando se termine la instancia
    }
    tags = {
      Name = "galera1"
    }
}
resource "aws_instance" "galera2" {
    ami = "ami-0cd59ecaf368e5ccf"
    instance_type = "t3.small"
    key_name = aws_key_pair.s4lazz_key.key_name
    vpc_security_group_ids = [
      aws_security_group.galera-cluster-sg.id
    ]
    root_block_device {
      volume_type           = "gp2"  # Tipo de volumen EBS (por ejemplo, gp2, io1, st1, sc1, standard)
      volume_size           = 25     # Tamaño del volumen en GB
      delete_on_termination = true   # Eliminar el volumen cuando se termine la instancia
    }
    tags = {
      Name = "galera2"
    }
}
resource "aws_instance" "haproxy" {
    ami = "ami-0cd59ecaf368e5ccf"
    instance_type = "t3.small"
    key_name = aws_key_pair.s4lazz_key.key_name
    vpc_security_group_ids = [
      aws_security_group.proxy-sg.id
    ]
    root_block_device {
      volume_type           = "gp2"  # Tipo de volumen EBS (por ejemplo, gp2, io1, st1, sc1, standard)
      volume_size           = 25     # Tamaño del volumen en GB
      delete_on_termination = true   # Eliminar el volumen cuando se termine la instancia
    }
    tags = {
      Name = "haproxy"
    }
}

resource "aws_security_group" "k8s-cluster-sg" {
  name        = "k8s-cluster-sg"
  description = "Security group para las instancias"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0
    to_port     = 30005
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["172.31.32.0/20"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["172.31.32.0/20"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
    description = "Node to node all ports/protocols"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Node all egress"
  }
  
}


resource "aws_security_group" "proxy-sg" {
  name = "proxy-sg"
  description = "Security group para redis y ha-proxy"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 0
    to_port = 6380
    protocol = "tcp"
    cidr_blocks = [ "172.31.32.0/20" ]
  }
  ingress {
    from_port = 0
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = [ "172.31.32.0/20" ]
  }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "galera-cluster-sg" {
  name = "galera-cluster-sg"
  description = "Security group para el cluster de galera"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 0
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["172.31.32.0/20"]
  }
  ingress {
    from_port = 0
    to_port = 4567
    protocol = "tcp"
    cidr_blocks = ["172.31.32.0/20"]
  }
  ingress {
    from_port = 0
    to_port = 4567
    protocol = "udp"
    cidr_blocks = ["172.31.32.0/20"]
  }
  ingress {
    from_port = 0
    to_port = 4568
    protocol = "tcp"
    cidr_blocks = ["172.31.32.0/20"]
  }
    ingress {
    from_port = 0
    to_port = 4444
    protocol = "tcp"
    cidr_blocks = ["172.31.32.0/20"]
  }
  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["192.0.0.0/8"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["192.0.0.0/8"]
  }
}

resource "aws_key_pair" "s4lazz_key" {
    key_name = "s4lazz_ssh_key"
    public_key = file("id_rsa.pub")
}

data "template_file" "inventory" {
  template = file("./inventory.tpl")

  vars = {
    ec2_master_global_dns  = aws_instance.master_node.public_dns
    ec2_worker1_global_dns = aws_instance.worker1_node.public_dns
    ec2_worker2_global_dns = aws_instance.worker2_node.public_dns
    ec2_galera1_global_dns = aws_instance.galera1.public_dns
    ec2_galera2_global_dns = aws_instance.galera2.public_dns
    ec2_haproxy_global_dns   = aws_instance.haproxy.public_dns
    private_ip_master = aws_instance.master_node.private_ip
  }
}

data "template_file" "haproxy" {
  template = file("./proxy.tpl")

  vars = {
    private_ip_galera1 = aws_instance.galera1.private_ip
    private_ip_galera2 = aws_instance.galera2.private_ip


  }
}


data "template_file" "galera1" {
  template = file("./galera.tpl")

  vars = {
    private_ip_galera1 = aws_instance.galera1.private_ip
    private_ip_galera2 = aws_instance.galera2.private_ip
  }
}

data "template_file" "galera2" {
  template = file("./galera2.tpl")

  vars = {
    private_ip_galera1 = aws_instance.galera1.private_ip
    private_ip_galera2 = aws_instance.galera2.private_ip
  }
}

data "template_file" "configmap" {
  template = file("./urltopdf_configmap.tpl")

  vars = {
    proxy_private_ip = aws_instance.haproxy.private_ip
  }
}
resource "local_file" "inventory" {
  content  = data.template_file.inventory.rendered
  filename = "../pi_ansible/inventory.yaml"
}

resource "local_file" "haproxy" {
  content  = data.template_file.haproxy.rendered
  filename = "../pi_ansible/tasks/proxy/haproxy.cfg"
}

resource "local_file" "galera1" {
  content  = data.template_file.galera1.rendered
  filename = "../pi_ansible/tasks/galera/galera.cnf"
}

resource "local_file" "galera2" {
  content  = data.template_file.galera2.rendered
  filename = "../pi_ansible/tasks/galera/galera2.cnf"
}

resource "local_file" "configmap" {
  content  = data.template_file.configmap.rendered
  filename = "../pi_ansible/tasks/k8s/urltopdf_configmap.yml"
}

output "ec2_master_global_dns" {
  value = ["${aws_instance.master_node.public_dns}"]
}
output "ec2_worker1_global_dns" {
  value = ["${aws_instance.worker1_node.public_dns}"]
}
output "ec2_worker2_global_dns" {
  value = ["${aws_instance.worker2_node.public_dns}"]
}
output "ec2_haproxy_global_dns" {
  value = ["${aws_instance.haproxy.public_dns}"]
}
output "ec2_galera1_global_dns" {
  value = ["${aws_instance.galera1.public_dns}"]
}
output "ec2_galera2_global_dns" {
  value = ["${aws_instance.galera2.public_dns}"]
}

output "private_ip_master_node" {
  value = ["${aws_instance.master_node.private_ip}"]
}
output "private_ip_worker1" {
  value = ["${aws_instance.worker1_node.private_ip}"]
}
output "private_ip_worker2" {
  value = ["${aws_instance.worker2_node.private_ip}"]
}
output "private_ip_haproxy" {
  value = ["${aws_instance.haproxy.private_ip}"]
}
output "private_ip_galera1" {
  value = ["${aws_instance.galera1.private_ip}"]
}
output "private_ip_galera2" {
  value = ["${aws_instance.galera2.private_ip}"]
}