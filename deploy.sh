#!/bin/bash

#Copy code
git clone -b monolith https://github.com/express42/reddit.git
#Go folder and install application
cd reddit && bundle install
#Start application
puma -d
