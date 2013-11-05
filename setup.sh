#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
rm -rf /etc/apt/apt.conf.d/90forceyes
echo "APT::Get::Assume-Yes "true";" >> /etc/apt/apt.conf.d/90forceyes
echo "APT::Get::force-yes "true";" >> /etc/apt/apt.conf.d/90forceyes
sudo apt-get update
sudo apt-get install python-pip python-virtualenv python-numpy  python-matplotlib python-pandas ipython-notebook
cd /home/vagrant
virtualenv venv --system-site-packages
source venv/bin/activate
pip install --upgrade -r requirements.txt
ipython notebook --ip=* --no-browser &
sudo chown -R vagrant /home/vagrant/venv
