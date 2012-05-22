##
# Cookbook Name:: thin
# Definition :: thin_site
#
# Copyright 2012, KSONSoftware.com
# All rights reserved - Do Not Redistribute
#

##
# def: thin_site
# Usage:
#		thin_site "NameOfSite" do
#			port 1234
#		end
#
define :thin_site do

	## Default the environment to production
	params[:env_name] ||= "production"

	## Ensure that the default containers exist.
	["fs_pid_root","fs_log_root","fs_etc_root"].each do |fs|
		directory node.default["thin"][fs] do
			owner "ubuntu"
			group "ubuntu"
			action :create
			recursive true
		end
	end

	## Create the logging container for the environment.
	directory "%s/%s" % [node.default["thin"]["fs_log_root"],params[:env_name]] do
		owner "ubuntu"
		group "ubuntu"
		action :create
		recursive true
	end

	## Create the etc container for the environment.
	directory "%s/%s" % [node.default["thin"]["fs_etc_root"],params[:env_name]] do
		owner "ubuntu"
		group "ubuntu"
		action :create
		recursive true
	end

	## Create the thin yml file.
	template "%s/%s/%s.yml" % [node.default["thin"]["fs_etc_root"],params[:env_name],params[:name]] do
		mode "0755"
		owner "root"
		group "root"
		source "thin_site.yml.erb"
		cookbook "thin"
		variables({
			:port => params[:port],
			:name => params[:name],
			:env_name => params[:env_name]
		})
	end

	## Create the init script.
	template "/etc/init.d/%s_%s" % [params[:env_name],params[:name]] do
		mode "0755"
		owner "root"
		group "root"
		source "thin_site.yml.erb"
		cookbook "thin"
		variables({
			:port => params[:port],
			:name => params[:name],
			:env_name => params[:env_name]
		})
	end

end
