{
	"run_list": [ "role[base::default]", "role[nginx::default]", "role[thin_server::default]" ]
}
