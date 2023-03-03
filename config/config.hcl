log_level = "INFO"
server = true
datacenter = "az-1"
node_name = "consul-server-1"

ui_config {
	enabled = true
}

leave_on_terminate = true
data_dir = "C:\\tools\\consul\\data"

client_addr = "0.0.0.0"
bind_addr = "127.0.0.1"
advertise_addr = "127.0.0.1"

ports {
	http = 8500
	https = 8501
}

bootstrap_expect = 1

acl = {
	enabled = false,
	default_policy = "allow",
	enable_token_persistence = true
}

connect = {
	enabled = true
}
