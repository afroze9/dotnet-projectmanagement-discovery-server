$token="ba7a565d-9aa6-2753-d8bb-6258403dbcae"

consul acl policy create -name="kv-company-api" -description="Policy that grants KV access to company-api" -rules @company-api-policies.hcl -token="$token"
consul acl policy create -name="kv-project-api" -description="Policy that grants KV access to project-api" -rules @project-api-policies.hcl -token="$token"

consul acl token create -policy-name="kv-company-api" -service-identity="company-api" -token="$token"
consul acl token create -policy-name="kv-project-api" -service-identity="project-api" -token="$token"
