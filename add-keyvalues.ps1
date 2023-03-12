$token = "13585e24-52a3-e906-981a-b2246ed54d77"

consul kv put -token="$token" project-api/app-config @project-api-config.json
consul kv put -token="$token" company-api/app-config @company-api-config.json