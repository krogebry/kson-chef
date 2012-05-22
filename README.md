kson-chef
=========

KSONSoftware chef repo

= Bootstrapping new node

apt-get install git ruby1.9.1-dev make g++
gem install chef

mkdir /var/www
chown -R ubuntu:ubuntu /var/www

mkdir -p /var/chef-solo/roles
chown -R ubuntu:ubuntu /var/chef-solo

