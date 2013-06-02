#!/bin/bash
mkdir -p ~/install
cd ~/install
wget http://sourceforge.net/projects/netatalk/files/netatalk/3.0.4/netatalk-3.0.4.tar.gz/download
tar xvf download
rm -rf download
cd netatalk-3.0.4/
./configure --with-init-style=debian --with-zeroconf --with-cracklib --enable-krbV-uam --with-pam-confdir=/etc/pam.d --with-dbus-sysconf-dir=/etc/dbus-1/system.d
make
sudo make install
