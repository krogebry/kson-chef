##
# Capification

load 'deploy'

# Uncomment if you are using Rails' asset pipeline
# load 'deploy/assets'
Dir['vendor/gems/*/recipes/*.rb','vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

load 'config/deploy' # remove this line to skip loading any of the default tasks

namespace :deploy do
	task :finalize_update do
	end

	task :link_chef do
		run( "ln -s /var/www/kson-chef/current/ /var/www/kson-chef/current/chef" )
	end
	after "deploy:create_symlink", "deploy:link_chef" 
end

