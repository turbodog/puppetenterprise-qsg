mkdir puppet-enterprise-installer
tar -xf /vagrant/installme.tar --strip=1 -C puppet-enterprise-installer
sudo puppet-enterprise-installer/puppet-enterprise-installer -c /vagrant/custom-pe.conf
sudo /opt/puppetlabs/bin/puppet agent -t
