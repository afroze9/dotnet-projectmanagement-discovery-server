$token = "9979daff-df32-2dd7-13b7-ff91bc998e46"

consul kv put -token="$token" api-gateway/app-config @api-gateway-config.json
consul kv put -token="$token" company-api/app-config @company-api-config.json
consul kv put -token="$token" project-api/app-config @project-api-config.json
