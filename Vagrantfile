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

require 'ipaddr'
require 'stringio'

ph_net = IPAddr.new("192.168.20.16/28")
vm_net = IPAddr.new("192.168.20.32/27")

physical_hostname = %x[hostname -f].chomp
puts "Configuring for #{physical_hostname}"

mongod_disk_size = 1024 * 1024

configs = {
  "campbeltown.coverage.net" => {
    'campbeltown.stats.campbeltown.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", 1024],
        ["modifyvm", :id, "--cpus", 2],
        ["createhd", "--filename", "disks/campbeltown.stats.campbeltown.vdi", "--size", mongod_disk_size],
        ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", "disks/campbeltown.stats.campbeltown.vdi"]
      ],
      'ip' => (vm_net = vm_net.succ()).to_s()
    },
    'glenscotia.dns.campbeltown.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", 128]
      ],
      'ip' => (vm_net = vm_net.succ()).to_s()
    },
    'hazelburn.mongocfg.campbeltown.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", 256]
      ],
      'ip' => (vm_net = vm_net.succ()).to_s()
    },
    'kilkerran.puppetmaster.campbeltown.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", 128]
      ],
      'ip' => (nameserver = vm_net = vm_net.succ()).to_s()
    }
  },
  "highland.coverage.net" => {
    'dalwhinnie.mongo.highland.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", 7 * 1024],
        ["modifyvm", :id, "--cpus", 4],
        ["createhd", "--filename", "disks/dalwhinnie.mongo.highland.vdi", "--size", mongod_disk_size],
        ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", "disks/dalwhinnie.mongo.highland.vdi"]
      ],
      'ip' => (vm_net = vm_net.succ()).to_s()
    },
    'glenmorangie.mongo.highland.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", 7 * 1024],
        ["modifyvm", :id, "--cpus", 4],
        ["createhd", "--filename", "disks/glenmorangie.mongo.highland.vdi", "--size", mongod_disk_size],
        ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", "disks/glenmorangie.mongo.highland.vdi"]
      ],
      'ip' => (vm_net = vm_net.succ()).to_s()
    },
    'oldpulteney.mongocfg.highland.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", 256]
      ],
      'ip' => (vm_net = vm_net.succ()).to_s()
    },
    'thedalmore.mongo.highland.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", 1024],
        ["modifyvm", :id, "--cpus", 2],
        ["createhd", "--filename", "disks/thedalmore.mongo.highland.vdi", "--size", mongod_disk_size],
        ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", "disks/thedalmore.mongo.highland.vdi"]
      ],
      'ip' => (vm_net = vm_net.succ()).to_s()
    },
    'themacallan.mongo.highland.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", 1024],
        ["modifyvm", :id, "--cpus", 2],
        ["createhd", "--filename", "disks/themacallan.mongo.highland.vdi", "--size", mongod_disk_size],
        ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", "disks/themacallan.mongo.highland.vdi"]
      ],
      'ip' => (vm_net = vm_net.succ()).to_s()
    }
  },
  "island.coverage.net" => {
    'highlandpark.mongo.island.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", 7 * 1024],
        ["modifyvm", :id, "--cpus", 4],
        ["createhd", "--filename", "disks/highlandpark.mongo.island.vdi", "--size", mongod_disk_size],
        ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", "disks/highlandpark.mongo.island.vdi"]
      ],
      'ip' => (vm_net = vm_net.succ()).to_s()
    },
    'isleofjura.mongo.island.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", 1024],
        ["modifyvm", :id, "--cpus", 2],
        ["createhd", "--filename", "disks/isleofjura.mongo.island.vdi", "--size", mongod_disk_size],
        ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", "disks/isleofjura.mongo.island.vdi"]
      ],
      'ip' => (vm_net = vm_net.succ()).to_s()
    },
    'ledaig.mongo.island.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", 7 * 1024],
        ["modifyvm", :id, "--cpus", 4],
        ["createhd", "--filename", "disks/ledaig.mongo.island.vdi", "--size", mongod_disk_size],
        ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", "disks/ledaig.mongo.island.vdi"]
      ],
      'ip' => (vm_net = vm_net.succ()).to_s()
    },
    'talisker.mongocfg.island.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", 256]
      ],
      'ip' => (vm_net = vm_net.succ()).to_s()
    },
    'tobermory.mongo.island.coverage.net' => {
      'customize' => [
        ["modifyvm", :id, "--memory", 1024],
        ["modifyvm", :id, "--cpus", 2],
        ["createhd", "--filename", "disks/tobermory.mongo.island.vdi", "--size", mongod_disk_size],
        ["storageattach", :id, "--storagectl", "SATA Controller", "--port", 1, "--device", 0, "--type", "hdd", "--medium", "disks/tobermory.mongo.island.vdi"]
      ],
      'ip' => (vm_net = vm_net.succ()).to_s()
    }
  }
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
      ptr  => true;
RECORD

configs.each do |ph_name, vm_configs|
  dns_f.printf(recordf, ph_name.partition(".coverage.net").first, (ph_net = ph_net.succ()).to_s())
  vm_configs.each do |vm_name, vm_config|
    dns_f.printf(recordf, vm_name.partition(".coverage.net").first, vm_config['ip'])
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
      "--nictype2", "virtio"
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
          "eth1_network"       => "192.168.20.32",
          "eth1_broadcast"     => "192.168.20.63",
          "nameserver"         => nameserver,
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
