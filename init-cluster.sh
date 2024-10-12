#!/bin/bash

kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=10.0.0.20
export KUBECONFIG=/etc/kubernetes/admin.conf

# Container Network
kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml

connect_command=$(kubeadm token create --print-join-command)
ssh -o StrictHostKeyChecking=no root@kworker1 "$connect_command"
ssh -o StrictHostKeyChecking=no root@kworker2 "$connect_command"

mkdir -p /home/vagrant/.kube
cp /etc/kubernetes/admin.conf /home/vagrant/.kube/config
chmod 644 /home/vagrant/.kube/config