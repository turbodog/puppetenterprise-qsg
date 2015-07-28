cp /vagrant/lotsofnodes/mknodes.sh /home/vagrant
sudo hostname agent
echo "curl -k https://master:8140/packages/current/install.bash | sudo bash" > /home/vagrant/installagent.sh
chmod +x /home/vagrant/installagent.sh
