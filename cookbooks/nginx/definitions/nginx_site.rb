##
# Cookbook Name:: nginx
# Definition :: nginx_site
#
# Copyright 2012, KSONSoftware.com
# All rights reserved - Do Not Redistribute
#

##
# def: nginx_site
# Usage:
#		nginx_site "NameOfSite" do
#		end
#
define :nginx_site do

	## Default the environment to production.
	params[:env_name] ||= "production"

	## Default the server_names to an empty array.
	params[:server_names] ||= []

	## Default is to leave this off.
	params[:enable_stats] ||= false

	## Default is to have this on
	params[:enable_ssl] ||= true

	## If set to true this will throw up the "down for maint" pages.
	params[:enable_static] ||= false

	## Create the logging container for the environment.
	directory "%s/%s" % [node.default["nginx"]["fs_log_root"],params[:env_name]] do
		owner "ubuntu"
		group "ubuntu"
		action :create
		recursive true
	end

	if(params[:enable_ssl] == true)
		## Create the ssl container for the environment.
		directory "%s/%s" % [node.default["nginx"]["fs_ssl_root"],params[:name]] do
			owner "ubuntu"
			group "ubuntu"
			action :create
			recursive true
		end

		## Create a self-signed cert for use on this node.
		bash "Create SSL Certificates" do
			cwd "%s/%s" % [node.default["nginx"]["fs_ssl_root"],params[:name]]
			code <<-EOH
umask 077
openssl genrsa 2048 > server.key.pem
openssl req -subj "/C=US/ST=WA/L=Seattle/O=KSONSoftware/OU=DevOps/CN=#{node.fqdn}" -new -x509 -nodes -sha1 -days 3650 -key server.key.pem > server.crt.pem
cat server.key.pem server.crt.pem > server.pem
EOH
			not_if {File.exists?( "%s/%s/server.pem" % [node.default["nginx"]["fs_ssl_root"],params[:name]] )}
			notifies :restart, "service[nginx]"
		end
	end

	## Create the site config file
	template "%s/sites-available/%s" % [node.default["nginx"]["fs_etc_root"],params[:name]] do
		mode "0755"
		owner "root"
		group "root"
		source "thin_site.yml.erb"
		cookbook "thin"
		variables({
			:name => params[:name],
			:env_name => params[:env_name],
			:upstreams => params[:upstreams],
			:enable_ssl => params[:enable_ssl],
			:enable_stats => params[:enable_stats],
			:server_names => params[:server_names],
			:enable_static => params[:enable_static]
		})
	end

end
