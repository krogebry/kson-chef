##
# Default attributes for nxing sites.

default["nginx"] = {}
default["nginx"]["fs_etc_root"] = "/etc/nginx"
default["nginx"]["fs_log_root"] = "/var/log/nginx"
default["nginx"]["fs_pid_root"] = "/var/run/nginx"
default["nginx"]["fs_ssl_root"] = "/etc/nginx/ssl"
default["nginx"]["fs_www_root"] = "/var/www"

default["nginx"]["client_max_body_size"] = "3M"


