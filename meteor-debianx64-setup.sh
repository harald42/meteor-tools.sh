#!/bin/sh

apt-get install -y curl aptitude git mc sudo
apt-get install -y python-software-properties
apt-get install -y build-essential mongodb

wget https://nodejs.org/dist/v0.10.41/node-v0.10.41-linux-x64.tar.gz
tar xfz node-v0.10.41-linux-x64.tar.gz

cp -rf node-v0.10.41-linux-x64/bin/* /usr/bin
cp -rf node-v0.10.41-linux-x64/include/* /usr/include
cp -rf node-v0.10.41-linux-x64/lib/* /usr/lib
cp -rf node-v0.10.41-linux-x64/share/* /usr/share

npm install -g forever

