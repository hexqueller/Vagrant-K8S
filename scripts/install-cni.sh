#!/bin/bash

# add repo from docker and install containerd
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install containerd -y

# Configure cni
rm -rf /etc/containerd/config.toml
cat <<EOF | sudo tee /etc/containerd/config.toml
version = 2
[plugins]
  [plugins."io.containerd.grpc.v1.cri"]
   [plugins."io.containerd.grpc.v1.cri".containerd]
      [plugins."io.containerd.grpc.v1.cri".containerd.runtimes]
        [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc]
          runtime_type = "io.containerd.runc.v2"
          [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
            SystemdCgroup = true
EOF

# Important modules
modprobe br_netfilter
modprobe overlay

systemctl restart containerd
