#!/bin/sh

apt-get install -y curl aptitude git mc sudo
apt-get install -y python-software-properties
apt-get install -y build-essential mongodb

curl -sL https://deb.nodesource.com/setup | bash -
apt-get install -y build-essential python-dev nodejs
node -v

npm install -g forever

