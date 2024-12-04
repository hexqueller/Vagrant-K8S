### vagrant box [download (VPN requred)](https://portal.cloud.hashicorp.com/vagrant/discover/almalinux/9) 
```bash
vagrant box add ./e11a3fd9-c492-4473-ad74-6e49652cf586 --name=almalinux/9
```

Setup network by default \
windows ps
```bash
$env:BRIDGE_NAME="eno2"
```
linux
```bash
export BRIDGE_NAME="eno2"
```