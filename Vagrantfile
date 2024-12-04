Vagrant.configure("2") do |config|

  bridge_name = ENV['BRIDGE_NAME'] || "Intel(R) Ethernet Connection (17) I219-V"
  bridges = [bridge_name, "eno1"]

  machines = [
    { name: "kmaster", ip: "10.0.0.20" },
    { name: "kworker1", ip: "10.0.0.21" },
    { name: "kworker2", ip: "10.0.0.22" }
  ]

  machines.reverse.each do |machine|
    config.vm.define machine[:name] do |node|
      node.vm.box = "almalinux/9"
      node.vm.hostname = machine[:name]
      node.vm.network "public_network", 
                     bridge: bridges,
                     ip: machine[:ip],
                     auto_config: true
      node.vm.provider "virtualbox" do |vb|
        vb.memory = "4096"
        vb.cpus = 2
      end

      node.vm.provision "shell", path: "./scripts/prepareOS.sh"
      node.vm.provision "shell", path: "./scripts/install-cni.sh"
      node.vm.provision "shell", path: "./scripts/install-k8s.sh"
      node.vm.provision "shell", path: "./scripts/install-helm.sh"
      node.vm.provision "shell", path: "./scripts/after-all.sh"

      if machine[:name] == "kmaster"
        node.vm.provision "shell", path: "./scripts/init-cluster.sh"
      end
    end
  end
end
