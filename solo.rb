##
# chef-solo awesomeness
#
log_level :debug                                                                                                                                                                    
log_location STDOUT
cache_type "BasicFile"
cache_options({ :path => "%s/.chef/checksums" % ENV['HOME'], :skip_expires => true })
file_cache_path "%s/.chef/cache/" % ENV['HOME']
file_backup_path "%s/.chef/cache/" % ENV['HOME']
cookbook_path [
	"/var/www/application_name/chef/cookbooks"
]
role_path [
	"/home/krogebry/Dropbox/Private/Krogebry/chef/roles"
]

