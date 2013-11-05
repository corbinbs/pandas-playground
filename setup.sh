#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
rm -rf /etc/apt/apt.conf.d/90forceyes
echo "APT::Get::Assume-Yes "true";" >> /etc/apt/apt.conf.d/90forceyes
echo "APT::Get::force-yes "true";" >> /etc/apt/apt.conf.d/90forceyes
sudo apt-get update
sudo apt-get install python-pip python-virtualenv python-numpy python-matplotlib python-pandas ipython-notebook xvfb
cd /home/vagrant
sudo chown -R vagrant /home/vagrant/*
su vagrant -c "virtualenv venv --system-site-packages"
su vagrant -c "/home/vagrant/venv/bin/pip install --upgrade -r /vagrant/requirements.txt"
su vagrant -c "ipython notebook --ip=* --no-browser &"
