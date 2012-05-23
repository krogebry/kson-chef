##
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2012, KSONSoftware.com
#
# All rights reserved - Do Not Redistribute
#

package "nginx" do
	action :install
end

cookbook_file "/etc/nginx/nginx.conf" do
	source "nginx.conf"
end

service "nginx" do
	action [ :enable, :start ]
	supports :status => true, :restart => true, :reload => true
end

