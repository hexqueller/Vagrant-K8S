Vagrant.configure("2") do |config|

  machines = [
    { name: "kmaster", ip: "10.0.0.20" },
    { name: "kworker1", ip: "10.0.0.21" },
    { name: "kworker2", ip: "10.0.0.22" }
  ]

  machines.reverse.each do |machine|
    config.vm.define machine[:name] do |node|
      node.vm.box = "almalinux/9"
      node.vm.hostname = machine[:name]
      node.vm.network "public_network", bridge: "eno1", ip: machine[:ip], dev: "eno1"
      node.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
        vb.cpus = 2
      end

      node.vm.provision "shell", path: "./scripts/prepareOS.sh"
      node.vm.provision "shell", path: "./scripts/install-cni.sh"
      node.vm.provision "shell", path: "./scripts/install-k8s.sh"

      if machine[:name] == "kmaster"
        node.vm.provision "shell", path: "./scripts/init-cluster.sh"
      end
    end
  end
end
