##
# chef-solo awesomeness
#
log_level :debug                                                                                                                                                                    
log_location STDOUT
cache_type "BasicFile"
cache_options({ :path => "%s/.chef/checksums" % ENV['HOME'], :skip_expires => true })
file_cache_path "%s/.chef/cache/" % ENV['HOME']
file_backup_path "%s/.chef/cache/" % ENV['HOME']

cookbook_paths = []

["kson-chef","application_name"].each do |appName|
	role_paths.push( "/var/www/%s/chef/roles" % appName
	cookbook_paths.push( "/var/www/%s/chef/cookbooks" % appName
]
coobook_path cookbook_paths
role_path role_paths

