##
# Capification

load 'deploy'

# Uncomment if you are using Rails' asset pipeline
# load 'deploy/assets'
Dir['vendor/gems/*/recipes/*.rb','vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

load 'config/deploy' # remove this line to skip loading any of the default tasks

namespace :deploy do
	task :finalize_update do
		run( "ln -s /var/www/kson-chef/current/chef /var/www/kson-chef/current/" )
	end
end

#after :deploy, ""
