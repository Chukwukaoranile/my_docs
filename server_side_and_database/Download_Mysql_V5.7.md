# How to Download Mysql, version 5.7

#### You need to cleanup your machine, If Mysql is alredy installed in the machine.
##### Stop mysql

	sudo service mysql stop

	sudo apt-get remove --purge mysql-server mysql-client mysql-common

	sudo apt-get autoremove

	sudo apt-get autoclean

	sudo rm /etc/mysql/my.cnf

	sudo rm /etc/my.cnf

	sudo dpkg --purge mysql-apt-config

	sudo apt-get update

#### Download packages and directories for the installation
	wget https://dev.mysql.com/get/mysql-apt-config_0.8.12-1_all.deb

	sudo dpkg -i mysql-apt-config_0.8.12-1_all.deb

	sudo apt update

	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 467B942D3A79BD29

	sudo apt-cache policy mysql-server

#### Select bionic and choose version 5.7, then select OK

	sudo apt update

	sudo apt upgrade -y

	sudo apt install -f mysql-client=5.7* mysql-community-server=5.7* mysql-server=5.7*

##### Restart Your server

	sudo systemctl status mysql

##### login into mysql server

	sudo mysql -u root -p

