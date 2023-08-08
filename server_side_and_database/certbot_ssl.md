# How to Install Haproxy (Load Blancer) and certbot HTTPS/SSL (Lets Encrypt)
### Create a bash script and place the following commands in it
	#!usr/bin/env bash
	# Install and configure Haproxy
	apt_get update -y
	apt-get install -y haproxy

	echo "ENABLED=1" >> /etc/default/haproxy
	echo "
	forntend my_blog
		bind *:80
		default_backend my_backend
	backend my_backend
		balance roundrobin
		server serverName1 IP_Address:80
		server serverName2 IP_Address:80
	"" >> /etc/haproxy/haproxy.cfg
	service haproxy reload
##### NB The above commands should be in a bash file, i.e. (.sh) and should be executable
#### Run the .sh file with sudo . eg. sudo ./install_haproxy.sh

### Install certbot for HTTPS/SSL Certificate
##### Installing packages
	sudo add-apt-repository -y ppa:certbot/certbot
	sudo apt-get update
	sudo apt-get install -y certbot
#### Stop Haproxy, in order to prevent prevent conflict with port 80. Alternatively --http-01-address 8888 to the command below for obtaining SSL Certificate

	sudo service haproxy stop
#### Obtaining SSL Certificate
	sudo certbot certonly --standalone -d domainName.com -d www.domainName.com
#### Restart Haproxy

	sudo service haproxy restart
#### Concatenate the fullchain.pem and publickey.pem into one file. The follwoing command will help do this

	sudo mkdir -p /etc/ssl/www.yourdomain.com
	sudo cat /etc/letsencrypt/live/www.yourDomain.com/fullchain.pem /etc/letsencrypt/live/www.yourDomain.com/privkey.pem | sudo tee /etc/ssl/www.yourDomain.com.pem

### locate your haproxy config file, clear the content and replace with following configuration

	sudo vim /etc/haproxy/haproxy.cfg

#### Configuration of Haproxy using round robin algirithm
	frontend myfrontend
        	bind *:80
		bind *:443 ssl crt /etc/ssl/www.yourdomain.com.pem
        	mode http
		acl letsencrypt-acl path_beg /.well-known/acme-challenge/
		use_backend letsencrypt-backend if letsencrypt-acl
		default_backend mybackend

	backend mybackend
		balance roundrobin
		http-request redirect scheme https unless { ssl_fc }
		server serverName1 IP_Address:80 check
        	server serverName1 IP_Address:80 check

	backend letsencrypt-backend
		server letsencrypt 127.0.0.1:8888
#### Restart Haproxy
	sudo service haproxy restart
### Authomatic Renewal of Certbot
#### Open crontab file
	crontab -e
##### Add the following command

	0 0 1 * * certbot renew --http-01-port 8888 --force-renewal

##### This command will force renewal of certificate everymonth
