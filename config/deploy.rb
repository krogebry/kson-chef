##
# Deployment configuration

set :scm, :git
set :repository, "git@github.com:krogebry/kson-chef.git"
set :application, "kson-chef"

set :user,'ubuntu'

set :deploy_to,"/var/www/%s" % application

#role :app,"app0.ksonsoftware.com", :primary => true
role :app,"app1.ksonsoftware.com", :primary => true

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
