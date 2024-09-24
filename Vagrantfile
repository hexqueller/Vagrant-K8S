Vagrant.configure("2") do |config|

    # Массив с параметрами виртуальных машин
    machines = [
      { name: "grafana", ip: "10.0.0.99" },
      { name: "http", ip: "10.0.0.98" },
      { name: "elk", ip: "10.0.0.97" }
    ]
  
    machines.each do |machine|
      config.vm.define machine[:name] do |node|
        node.vm.provider "virtualbox" do |vb|
          vb.memory = "2048"
          vb.cpus = 2
        end
        node.vm.box = "almalinux/9"
        config.vm.box_url = "almalinux.box"
        node.vm.hostname = machine[:name]
        node.vm.network "public_network", bridge: "eno1", ip: machine[:ip], dev: "eno1"
      end
    end
  end