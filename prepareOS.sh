#!/bin/bash

# /etc/hosts
echo "10.0.0.20  kmaster" >> /etc/hosts
echo "10.0.0.21  kworker1" >> /etc/hosts
echo "10.0.0.22  kworker2" >> /etc/hosts

yum install vim wget yum-utils socat -y

# Disable SELINUX
setenforce 0 # До перезагрузки
sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config # После перезагрузки

# Enable IPv4 packet forwarding
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.ipv4.ip_forward = 1
EOF
# Apply sysctl params without reboot
sudo sysctl --system
