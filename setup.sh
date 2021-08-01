#!/usr/bin/env bash

##### DEFAULTS #####

####################

# Set static IP configuration
cat < EOF >> sudo tee -a /etc/dhcpd.conf
interface wlan0
static ip_address=192.168.254.73/24
static routers=192.168.254.1
static domain_name_servers=1.1.1.1
EOF

## INSTALLING APPLICATIONS ##

sudo apt update && sudo apt upgrade -y

# Must use the docker convenience script as that is the only one to support Raspbian
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

sudo apt install python3-pip -y
sudo pip3 install docker-compose