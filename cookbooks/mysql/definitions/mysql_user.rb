##
# MySQL user setup

define :mysql_user do
	execute "Apply MySQL Permissions" do
		action :nothing
		command "mysql -u root -p#{node['mysql']['server_root_password']} < /etc/mysql/accessapi-grants.sql"
	end

	template "/etc/mysql/%s-grants.sql" do
		mode "0644"
		owner "root"
		group "root"
		source "grants.sql.erb"
		notifies :run, resources(:execute => "Apply MySQL Permissions"), :immediately
		variables({
		})
	end
end

