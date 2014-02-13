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

# PiPod Networking:
#
# Network:   192.168.20.64/27
# HostMin:   192.168.20.65
# HostMax:   192.168.20.94
# Broadcast: 192.168.20.95
# Hosts/Net: 30

require 'ipaddr'
require 'stringio'

ph_net = IPAddr.new("192.168.20.16/28")
vm_net = IPAddr.new("192.168.20.32/27")

physical_hostname = %x[hostname -f].chomp
puts "Configuring for #{physical_hostname}"

mongod_disk_size = 400 * 1024
mongod_memory    =   3 * 1024
mongod_cpus      =          1
node_memory      =   1 * 1024

configs = {
  "campbeltown.coverage.net" => {
    'hazelburn.mongocfg.campbeltown.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", 256]
      ],
      'ip' => "192.168.20.33"
    },
    'campbeltown.mongo.campbeltown.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", mongod_memory],
        ["modifyvm", :id, "--cpus", mongod_cpus],
        ["createhd", "--filename", "disks/campbeltown.mongo.campbeltown.vdi", "--size", mongod_disk_size],
        ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", "disks/campbeltown.mongo.campbeltown.vdi"]
      ],
      'ip' => "192.168.20.34"
    },
    'glenscotia.mongo.campbeltown.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", mongod_memory],
        ["modifyvm", :id, "--cpus", mongod_cpus],
        ["createhd", "--filename", "disks/glenscotia.mongo.campbeltown.vdi", "--size", mongod_disk_size],
        ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", "disks/glenscotia.mongo.campbeltown.vdi"]
      ],
      'ip' => "192.168.20.35"
    },
    'kilkerran.mongo.campbeltown.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", mongod_memory],
        ["modifyvm", :id, "--cpus", mongod_cpus],
        ["createhd", "--filename", "disks/kilkerran.mongo.campbeltown.vdi", "--size", mongod_disk_size],
        ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", "disks/kilkerran.mongo.campbeltown.vdi"]
      ],
      'ip' => "192.168.20.36"
    },
    'longrow.mongo.campbeltown.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", mongod_memory],
        ["modifyvm", :id, "--cpus", mongod_cpus],
        ["createhd", "--filename", "disks/longrow.mongo.campbeltown.vdi", "--size", mongod_disk_size],
        ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", "disks/longrow.mongo.campbeltown.vdi"]
      ],
      'ip' => "192.168.20.37"
    },
    'springbank.node.campbeltown.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", node_memory]
      ],
      'ip' => "192.168.20.38"
    },
    'glengyle.node.campbeltown.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", node_memory]
      ],
      'ip' => "192.168.20.53"
    }
  },
  "highland.coverage.net" => {
    'dalwhinnie.mongo.highland.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", mongod_memory],
        ["modifyvm", :id, "--cpus", mongod_cpus],
        ["createhd", "--filename", "disks/dalwhinnie.mongo.highland.vdi", "--size", mongod_disk_size],
        ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", "disks/dalwhinnie.mongo.highland.vdi"]
      ],
      'ip' => "192.168.20.39"
    },
    'fettercairn.node.highland.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", node_memory]
      ],
      'ip' => "192.168.20.40"
    },
    'glenmorangie.mongo.highland.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", mongod_memory],
        ["modifyvm", :id, "--cpus", mongod_cpus],
        ["createhd", "--filename", "disks/glenmorangie.mongo.highland.vdi", "--size", mongod_disk_size],
        ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", "disks/glenmorangie.mongo.highland.vdi"]
      ],
      'ip' => "192.168.20.41"
    },
    'glenturret.node.highland.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", node_memory]
      ],
      'ip' => "192.168.20.42"
    },
    'oldpulteney.mongocfg.highland.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", 256]
      ],
      'ip' => "192.168.20.43"
    },
    'thedalmore.mongo.highland.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", mongod_memory],
        ["modifyvm", :id, "--cpus", mongod_cpus],
        ["createhd", "--filename", "disks/thedalmore.mongo.highland.vdi", "--size", mongod_disk_size],
        ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", "disks/thedalmore.mongo.highland.vdi"]
      ],
      'ip' => "192.168.20.44"
    },
    'themacallan.mongo.highland.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", mongod_memory],
        ["modifyvm", :id, "--cpus", mongod_cpus],
        ["createhd", "--filename", "disks/themacallan.mongo.highland.vdi", "--size", mongod_disk_size],
        ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", "disks/themacallan.mongo.highland.vdi"]
      ],
      'ip' => "192.168.20.45"
    }
  },
  "island.coverage.net" => {
    'arran.node.island.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", node_memory]
      ],
      'ip' => "192.168.20.46"
    },
    'highlandpark.mongo.island.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", mongod_memory],
        ["modifyvm", :id, "--cpus", mongod_cpus],
        ["createhd", "--filename", "disks/highlandpark.mongo.island.vdi", "--size", mongod_disk_size],
        ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", "disks/highlandpark.mongo.island.vdi"]
      ],
      'ip' => "192.168.20.47"
    },
    'isleofjura.mongo.island.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", mongod_memory],
        ["modifyvm", :id, "--cpus", mongod_cpus],
        ["createhd", "--filename", "disks/isleofjura.mongo.island.vdi", "--size", mongod_disk_size],
        ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", "disks/isleofjura.mongo.island.vdi"]
      ],
      'ip' => "192.168.20.48"
    },
    'ledaig.mongo.island.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", mongod_memory],
        ["modifyvm", :id, "--cpus", mongod_cpus],
        ["createhd", "--filename", "disks/ledaig.mongo.island.vdi", "--size", mongod_disk_size],
        ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", "disks/ledaig.mongo.island.vdi"]
      ],
      'ip' => "192.168.20.49"
    },
    'scapa.node.island.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", node_memory]
      ],
      'ip' => "192.168.20.50"
    },
    'talisker.mongocfg.island.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", 256]
      ],
      'ip' => "192.168.20.51"
    },
    'tobermory.mongo.island.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", mongod_memory],
        ["modifyvm", :id, "--cpus", mongod_cpus],
        ["createhd", "--filename", "disks/tobermory.mongo.island.vdi", "--size", mongod_disk_size],
        ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", "disks/tobermory.mongo.island.vdi"]
      ],
      'ip' => "192.168.20.52"
    }
  },
  "lowland.coverage.net" => {
    'ailsabay.stats.lowland.coverage.net' => {
      # 'customize' => [
      #   ["modifyvm", :id, "--memory", 1024],
      #   ["modifyvm", :id, "--cpus", 2],
      #   ["createhd", "--filename", "disks/ailsabay.stats.lowland.vdi", "--size", 250 * 1024],
      #   ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", "disks/ailsabay.stats.lowland.vdi"]
      # ],
      'ip' => "192.168.20.20"
    },
    'annandale.dns.lowland.coverage.net' => {
      'ip' => "192.168.20.20"
    },
  },
  "islay.coverage.net" => {
    'ardbeg.dns.islay.coverage.net' => {
      'ip' => "192.168.20.21"
    },
    'bowmore.beanstalk.islay.coverage.net' => {
      'ip' => "192.168.20.21"
    },
  },
  "pipod00.coverage.net" => {
    'rpi-0000.node.pipod00.coverage.net' => {
      'ip' => "192.168.20.65"
    },
    'rpi-0001.node.pipod00.coverage.net' => {
      'ip' => "192.168.20.66"
    },
    'rpi-0002.node.pipod00.coverage.net' => {
      'ip' => "192.168.20.67"
    },
    'rpi-0003.node.pipod00.coverage.net' => {
      'ip' => "192.168.20.68"
    },
    'rpi-0004.node.pipod00.coverage.net' => {
      'ip' => "192.168.20.69"
    },
    'rpi-0005.node.pipod00.coverage.net' => {
      'ip' => "192.168.20.70"
    },
    'rpi-0006.node.pipod00.coverage.net' => {
      'ip' => "192.168.20.71"
    },
    'rpi-0007.node.pipod00.coverage.net' => {
      'ip' => "192.168.20.72"
    },
    'rpi-0008.node.pipod00.coverage.net' => {
      'ip' => "192.168.20.73"
    },
    'rpi-0009.node.pipod00.coverage.net' => {
      'ip' => "192.168.20.74"
    },
    'rpi-000a.node.pipod00.coverage.net' => {
      'ip' => "192.168.20.75"
    },
    'rpi-000b.node.pipod00.coverage.net' => {
      'ip' => "192.168.20.76"
    },
    'rpi-000c.node.pipod00.coverage.net' => {
      'ip' => "192.168.20.77"
    },
    'rpi-000d.node.pipod00.coverage.net' => {
      'ip' => "192.168.20.78"
    },
  },
}

# Generate DNS configuration file
dns_f = File.open("modules/coverage/manifests/dns/all.pp", "w")
dns_f.puts <<-HEADER
# == Class: coverage::dns::all
#
# DNS definitions for all physical and virtual machines
#
# Generated by Vagrantfile
#
class coverage::dns::all {
  dns::record::a{
HEADER

recordf = <<-RECORD
    '%s':
      zone => 'coverage.net',
      data => ['%s'],
      ptr  => %s;
RECORD

configs.each do |ph_name, vm_configs|
  dns_f.printf(recordf, ph_name.partition(".coverage.net").first, (ph_net = ph_net.succ()).to_s(), 'true')
  vm_configs.each do |vm_name, vm_config|
    dns_f.printf(recordf, vm_name.partition(".coverage.net").first, vm_config['ip'], (ph_net != vm_config['ip'])?'true':'false')
  end
end

dns_f.puts <<-FOOTER
  }
}
FOOTER
dns_f.close

# Establish configuration for this host
vm_config = configs[physical_hostname]
if vm_config == nil
  printf "No configuration found for %s. Exiting\n", physical_hostname
  exit
end

Vagrant.configure("2") do |config|

  config.vm.box = "JessieBase"
  config.vm.box_url = "http://coverage.300brand.co/JessieBase.box"
  config.ssh.default.private_key_path = "vagrant_rsa"

  # Create eth1 adapter
  config.vm.provider :virtualbox do |vb|
    vb.customize [
      "modifyvm", :id,
      "--nic2", "bridged",
      "--bridgeadapter2", "eth0",
      "--nictype2", "82543GC"
    ]
  end

  # Disable annoying stdin is not a tty error
  config.vm.provision :shell, :inline => "sed -i 's/^mesg n$/tty -s \\&\\& mesg n/g' /root/.profile"

  # Install puppet on guest
  config.vm.provision :shell, :inline => "[ -x /usr/bin/puppet ] || (apt-get update && apt-get install -y puppet)"

  vm_config.each do |vm_hostname, cfg|
    config.vm.define vm_hostname.split(".")[0,2].join(".") do |m|
      m.vm.hostname = vm_hostname

      # Add Virtualbox customizations
      m.vm.provider :virtualbox do |vb|
        vb.gui = false
        cfg["customize"].each do |custom|
          vb.customize custom
        end
      end

      # Setup eth1 interface
      m.vm.provision :puppet do |puppet|
        puppet.facter = {
          "eth1_ip"            => cfg["ip"],
          "eth1_broadcast"     => "192.168.20.63",
          "eth1_gateway"       => "192.168.20.1",
          "eth1_network"       => "192.168.20.32",
          "nameserver"         => "192.168.20.20",
        }
        puppet.manifest_file   = "eth1.pp"
        puppet.manifests_path  = "manifests"
        puppet.module_path     = "modules"
        puppet.options         = "--verbose"
      end

      m.vm.provision :puppet do |puppet|
        puppet.manifest_file   = "site.pp"
        puppet.manifests_path  = "manifests"
        puppet.module_path     = "modules"
        puppet.options         = "--verbose"
      end
    end
  end
end
