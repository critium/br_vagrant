#!/usr/bin/env bash

echo "nameserver 208.67.222.222" | sudo tee /etc/resolvconf/resolv.conf.d/base > /dev/null
sudo apt-get update

cd /vagrant
sudo cat vagrantjdk.bin.part?? > vagrantjdk.bin
sudo cp /vagrant/vagrantjdk.bin /opt
sudo chmod +x /opt/vagrantjdk.bin
cd /opt
sudo ./vagrantjdk.bin
sudo mkdir -p /usr/lib/jvm/jdk1.6
sudo mv jdk1.6*/* /usr/lib/jvm/jdk1.6
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.6/bin/java" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/jdk1.6/bin/javaws" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.6/bin/javac" 1

sudo debconf-set-selections <<< 'mysql-server-<version> mysql-server/root_password password g0lfsw1ng'
sudo debconf-set-selections <<< 'mysql-server-<version> mysql-server/root_password_again password g0lfsw1ng'
sudo apt-get -y install mysql-server
#DONT NEED## mysqladmin -u root password g0lfsw1ng
mysql -uroot -pg0lfsw1ng -e "create database betareturn;";
mysql -uroot -pg0lfsw1ng -e "create database betareturn_scratch;";

sudo apt-get -y install git

# mkdir -p /home/vagrant/code
# ln -fs /vagrant/code /home/vagrant/code



