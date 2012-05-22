##
# Default attributes for use by thin recipes

default["thin"] = {}
default["thin"]["rackup"] = "config.ru"
default["thin"]["timeout"] = 30
default["thin"]["servers"] = 3
default["thin"]["address"] = "127.0.0.1"
default["thin"]["require"] = []
default["thin"]["max_conns"] = 1024
default["thin"]["daemonize"] = true
default["thin"]["fs_etc_root"] = "/etc/thin"
default["thin"]["fs_log_root"] = "/var/log/thin"
default["thin"]["fs_pid_root"] = "/var/run/thin"
default["thin"]["fs_www_root"] = "/var/www"
default["thin"]["max_persistent_conns"] = 512

