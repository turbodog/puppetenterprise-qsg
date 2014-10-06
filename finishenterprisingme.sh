mkdir puppet-enterprise-installer
tar -xf /vagrant/installme.tar --strip=1 -C puppet-enterprise-installer
sudo puppet-enterprise-installer/puppet-enterprise-installer -a /vagrant/master.answers
