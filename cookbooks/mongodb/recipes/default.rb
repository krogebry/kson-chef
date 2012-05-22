##
# Cookbook Name:: mongodb
# Recipe:: default
#
# Copyright 2012, KSONSoftware.com
#
# All rights reserved - Do Not Redistribute
#

package "mongodb" do
	action :install
end

template "/etc/mongodb/mongodb.conf" do
	source "mongodb.conf.erb"
end
