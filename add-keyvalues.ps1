$token = "ba7a565d-9aa6-2753-d8bb-6258403dbcae"

consul kv put -token="$token" project-api/app-config @project-api-config.json
consul kv put -token="$token" company-api/app-config @company-api-config.json