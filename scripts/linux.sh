ELVER=`gawk -F' ' '{print $4}' /etc/redhat-release | head -c1`
if [ "$ELVER" = "7" ]; then
 systemctl stop firewalld
 systemctl disable firewalld >& /dev/null
else
  sudo service iptables stop
  sudo chkconfig iptables off
fi

cp /vagrant/lotsofnodes/mknodes.sh /home/vagrant
sudo echo 'pathmunge /usr/local/bin' > /etc/profile.d/usr_local_bin.sh
sudo chmod +x /etc/profile.d/usr_local_bin.sh

