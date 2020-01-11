#!/bin/bash

#Install Ruby
apt update
apt install -y ruby-full ruby-bundler build-essential
# Install MongoDB
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xd68fa50fea312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list
apt-get update
apt-get install -y mongodb-org
systemctl enable mongod
#Copy code
git clone -b monolith https://github.com/express42/reddit.git
#Go folder and install application
cd reddit && bundle install
#Start application
puma -d
