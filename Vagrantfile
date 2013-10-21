# -*- mode: ruby -*-
# vi: set ft=ruby :

# Physical Machine Networking:
#
# Network:   192.168.20.16/28
# HostMin:   192.168.20.17
# HostMax:   192.168.20.30
# Broadcast: 192.168.20.31
# Hosts/Net: 14

# Virtual Machine Networking:
#
# Network:   192.168.20.32/27
# HostMin:   192.168.20.33
# HostMax:   192.168.20.62
# Broadcast: 192.168.20.63
# Hosts/Net: 30

physical_hostname = %x[hostname -f].chomp
puts "Configuring for #{physical_hostname}"

puppet_master = ["192.168.20.33", "kilkerran.puppetmaster.campbeltown.coverage.net"]

configs = {
  "sable.localhost" => {
    puppet_master[1] => {
      "customize" => [
        ["modifyvm", :id, "--memory", 128]
      ],
      "ip" => puppet_master[0]
    },
    "glenscotia.dns.campbeltown.coverage.net" => {
      "customize" => [
        ["modifyvm", :id, "--memory", 128]
      ],
      "ip" => "192.168.20.34"
    }
  },
  "highland.coverage.net"    => {

  },
  "island.coverage.net"      => {

  }
}

vm_config = configs[physical_hostname]

Vagrant.configure("2") do |config|

  config.vm.box = "WheezyBase"
  config.ssh.default.private_key_path = "vagrant_rsa"

  # Create eth1 adapter
  config.vm.provider :virtualbox do |vb|
    vb.customize [
      "modifyvm", :id,
      "--nic2", "bridged",
      "--bridgeadapter2", "eth0",
      "--nictype2", "virtio"
    ]
  end

  # Disable annoying stdin is not a tty error
  config.vm.provision :shell, :inline => "sed -i 's/^mesg n$/tty -s \\&\\& mesg n/g' /root/.profile"

  # Install puppet on guest
  config.vm.provision :shell, :inline => "[ -x /usr/bin/puppet ] || (apt-get update && apt-get install -y puppet)"

  vm_config.each do |vm_hostname, cfg|
    config.vm.define vm_hostname.partition(".").first do |m|
      m.vm.hostname = vm_hostname

      # Add Virtualbox customizations
      m.vm.provider :virtualbox do |vb|
        cfg["customize"].each do |custom|
          vb.customize custom
        end
      end

      m.vm.provision :puppet do |puppet|
        puppet.facter = {
          "eth1_ip"            => cfg["ip"],
          "eth1_network"       => "192.168.20.32",
          "eth1_broadcast"     => "192.168.20.63",
          "nameserver"         => "192.168.20.34",
          "puppet_master_host" => puppet_master[1],
        }
        puppet.manifest_file   = "vagrant.pp"
        puppet.manifests_path  = "manifests"
        puppet.module_path     = "modules"
        puppet.options         = "--verbose --debug"
      end
    end
  end
end
