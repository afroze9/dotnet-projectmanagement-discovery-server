log_level  = "INFO"
server     = true
datacenter = "az-1"
node_name  = "consul-server-1"

ui_config {
  enabled = true
}

leave_on_terminate = true
data_dir           = "C:\\tools\\consul\\data"

client_addr    = "0.0.0.0"
bind_addr      = "127.0.0.1"
advertise_addr = "127.0.0.1"

ports {
  http  = 8500
  https = 8501
}

bootstrap_expect = 1

acl = {
  enabled        = true,
  default_policy = "deny",
  down_policy    = "extend-cache",
  tokens         = {
    agent = "79ae268b-7cfe-e025-8743-9cc50e3ac481"
  }
}

connect = {
  enabled = true
}
