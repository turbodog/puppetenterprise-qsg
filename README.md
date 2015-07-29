# Quick Start Guide Test Environment

## Overview
This repository provides a Vagrant environment so that you can easily spin up a multi-machine environment to test and evaluate the [Puppet Enterprise Quick Start Guide](http://docs.puppetlabs.com/pe/latest/quick_start.html) or a basic installation scenario. Currently, the Vagrant environment only provides a Linux master and agent node and not an additional Windows node.

## Prequisites
Vagrant (tested with v1.6.3)  
Virtualbox (tested with v4.3.12)  
[vagrant-hostmanager](https://github.com/smdahlen/vagrant-hostmanager) plugin  
Vagrant [centos-6.6-64-nocm](https://atlas.hashicorp.com/puppetlabs/boxes/centos-6.6-64-nocm) box  

## Usage
`vagrant plugin install vagrant-hostmanager`  
`vagrant box add puppetlabs/centos-6.6-64-nocm`  
`vagrant up`  
`vagrant snap take` (optional, to avoid having to destroy and recreate boxes when you want to start over with clean boxes)  
Put the EL 6 x86_64 [PE master install tarball](http://puppetlabs.com/download-puppet-enterprise) in this folder  
`vagrant ssh master` (if you get a password prompt, the correct response is *probably* your password on the host system as the vagrant-hostmaster plugin performs a sudo on your host)  
`tar -xzf /vagrant/puppet-enterprise-installer-whatever.tar.gz`  
`cd puppet-enterprise-install-whatever`  
`sudo ./puppet-enterprise-installer`  
In your browser, browse to https://master:3000 or https://localhost:3000 and complete the install  
Use `master` as the master's FQDN and `vagrant/vagrant` as the SSH username and password. If credential validation is failing before you begin installation, reset the vagrant user's passwd to `vagrant`.  
After installation, your master console will be available at https://master or https://localhost:4443  
To install the agent, `vagrant ssh agent`  
`curl -k https://master:8140/packages/current/install.bash | sudo bash`  
Accept the node request in the PE console  
To start fresh, if you took a snapshot in the step above, `vagrant snap rollback`

## Notes
* By default, master and agent will both be built from the [puppetlabs/centos-6.6-64-nocm](https://atlas.hashicorp.com/opentable/boxes/win-2012r2-standard-amd64-nocm) box. If you want a different OS, you can set this on the `config.vm.box` line in `Vagrantfile`
* Master ip address is 192.168.0.2  
* Agent ip address is 192.168.0.3  
* Port 3000 for the Puppet Enterprise installer web UI and port 4443 for the PE console are automatically forwarded to localhost  

