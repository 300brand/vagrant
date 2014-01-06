Setup
=====

Basic utilities - start out as root

	# apt-get purge nano
	# apt-get install git vim
	# git config --global user.name root
	# git config --global user.email root@`hostname -f`
	# apt-get install etckeeper
	# apt-get install ntp

sudo

	# apt-get install sudo
	# adduser scotch sudo
	# etckeeper commit "Added scotch user to sudo group"

Logout, log back in

	$ wget http://files.vagrantup.com/packages/a40522f5fabccb9ddabad03d836e120ff5d14093/vagrant_1.3.5_x86_64.deb
	$ sudo apt-get install virtualbox puppet
	$ sudo dpkg -i vagrant_*.deb
	$ git clone git@github.com:300brand/vagrant.git
