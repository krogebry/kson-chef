##
# Cookbook Name:: mongodb
# Recipe:: default
#
# Copyright 2012, KSONSoftware.com
#
# All rights reserved - Do Not Redistribute
#

template "/etc/mongodb/mongodb.conf" do
	mode "0755"
	owner "root"
	group "root"
	source "mongodb.conf.erb"
	variables({
		
	})
end
