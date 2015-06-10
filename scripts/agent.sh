cp /vagrant/lotsofnodes/mknodes.sh /home/vagrant
echo "curl -k https://master:8140/packages/current/install.bash | sudo bash -s agent:certname=agent" > /home/vagrant/installagent.sh
chmod +x /home/vagrant/installagent.sh
#/home/vagrant/installagent.sh
#sudo /usr/local/bin/puppet agent -t --certname agent
#exit 0
