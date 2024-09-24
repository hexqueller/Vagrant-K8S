Vagrant.configure("2") do |config|

    # Массив с параметрами виртуальных машин
    machines = [
      { name: "master", ip: "10.0.0.99" },
      { name: "node01", ip: "10.0.0.98" },
      { name: "node01", ip: "10.0.0.97" }
    ]
  
    machines.each do |machine|
      config.vm.define machine[:name] do |node|
        node.vm.provider "virtualbox" do |vb|
          vb.memory = "2048"
          vb.cpus = 2
        end
        node.vm.box = "almalinux/9"
        node.vm.hostname = machine[:name]
        node.vm.network "public_network", bridge: "eno1", ip: machine[:ip], dev: "eno1"
      end
    end
  end