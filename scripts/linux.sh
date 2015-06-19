sudo service iptables stop
sudo chkconfig iptables off
cp /vagrant/lotsofnodes/mknodes.sh /home/vagrant
sudo echo 'pathmunge /usr/local/bin' > /etc/profile.d/usr_local_bin.sh
sudo chmod +x /etc/profile.d/usr_local_bin.sh

