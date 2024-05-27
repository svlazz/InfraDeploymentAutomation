---
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: urltopdf
  name: urltopdf-config
data:
  HOST1: "${proxy_private_ip}"
  REDIS: "tcp://${proxy_private_ip}:6379"