##
# Cookbook Name:: unicorn
# Definition :: unicorn_site
#
# Copyright 2012, KSONSoftware.com
# All rights reserved - Do Not Redistribute
#

##
# def: unicorn_site
# Usage:
#		unicorn_site "NameOfSite" do
#			port 1234
#		end
#
define :unicorn_site do

	## Default the environment to production
	params[:env_name] ||= "production"

	## Ensure that the default containers exist.
	["fs_pid_root","fs_log_root","fs_etc_root"].each do |fs|
		directory node.default["unicorn"][fs] do
			owner "ubuntu"
			group "ubuntu"
			action :create
			recursive true
		end
	end

	## Create the logging container for the environment.
	directory "%s/%s" % [node.default["unicorn"]["fs_log_root"],params[:env_name]] do
		owner "ubuntu"
		group "ubuntu"
		action :create
		recursive true
	end

	["sockets","pids","logs"].each do |dirName|
		directory "%s/%s/current/tmp/%s" % [node.default["unicorn"]["fs_app_root"],params[:env_name],dirName] do
			owner "ubuntu"
			group "ubuntu"
			action :create
			recursive true
		end
	end

	## Create the init script.
	template "/etc/init.d/%s_%s" % [params[:env_name],params[:name]] do
		mode "0755"
		owner "root"
		group "root"
		source "unicorn_init.erb"
		cookbook "unicorn"
		variables({
			:port => params[:port],
			:name => params[:name],
			:env_name => params[:env_name]
		})
	end

end
