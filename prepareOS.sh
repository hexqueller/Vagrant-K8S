#!/bin/bash

# /etc/hosts
echo "10.0.0.20  kmaster" >> /etc/hosts
echo "10.0.0.21  kworker1" >> /etc/hosts
echo "10.0.0.22  kworker2" >> /etc/hosts

# Удобный софт
yum install vim wget -y

# Disable SELINUX
setenforce 0 # До перезагрузки
sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config # После перезагрузки