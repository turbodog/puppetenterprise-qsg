#!/bin/bash

if [ "$#" != "1" ]
then
	echo "enterpriseme [peinstaller.tar]"
	exit 1
fi

rm -f installme.tar
ln -s $1 installme.tar
vagrant up master
vagrant ssh -c /vagrant/finishenterprisingme.sh master
vagrant ssh master

