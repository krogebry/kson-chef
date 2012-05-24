##
# Cookbook Name:: mongodb
# Recipe:: default
#
# Copyright 2012, KSONSoftware.com
#
# All rights reserved - Do Not Redistribute
#

directory node.default["mongodb"]["fs_etc_root"] do
	owner "root"
	group "root"
	action :create
	recursive true
end

template "%s/mongodb.conf" % node.default["mongodb"]["fs_etc_root"] do
	mode "0755"
	owner "root"
	group "root"
	source "mongodb.conf.erb"
	variables({
	})
end


